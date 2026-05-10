const { Pool } = require('pg');
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '..', '.env') });

const categories = require('./categories');
const badges = require('./badges');
const challenges = require('./challenges');
const bcrypt = require('bcryptjs');

const pool = new Pool({
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT) || 5432,
  database: process.env.DB_NAME || 'nabungo',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
});

async function seed() {
  console.log('Seeding database...');
  const client = await pool.connect();

  try {
    await client.query('BEGIN');

    // Seed categories
    console.log('Seeding categories...');
    for (const cat of categories) {
      await client.query(
        `INSERT INTO categories (name, icon, color, type) 
         VALUES ($1, $2, $3, $4) 
         ON CONFLICT DO NOTHING`,
        [cat.name, cat.icon, cat.color, cat.type]
      );
    }

    // Seed badges
    console.log('Seeding badges...');
    for (const badge of badges) {
      await client.query(
        `INSERT INTO badges (name, description, icon, code) 
         VALUES ($1, $2, $3, $4) 
         ON CONFLICT (code) DO NOTHING`,
        [badge.name, badge.description, badge.icon, badge.code]
      );
    }

    // Seed challenges
    console.log('Seeding challenges...');
    for (const challenge of challenges) {
      await client.query(
        `INSERT INTO challenges (title, description, icon, difficulty, xp_reward, days_required, requirement_type, requirement_value) 
         VALUES ($1, $2, $3, $4, $5, $6, $7, $8) 
         ON CONFLICT DO NOTHING`,
        [challenge.title, challenge.description, challenge.icon, challenge.difficulty, challenge.xp_reward, challenge.days_required, challenge.requirement_type, challenge.requirement_value]
      );
    }

    // Seed dummy user
    console.log('Seeding dummy user...');
    const dummyEmail = 'demo@nabungo.app';
    const existingUser = await client.query('SELECT id FROM users WHERE email = $1', [dummyEmail]);
    
    if (existingUser.rows.length === 0) {
      const hashedPassword = await bcrypt.hash('demo123', 12);
      const userResult = await client.query(
        `INSERT INTO users (name, email, password, xp, level) 
         VALUES ($1, $2, $3, 250, 3) RETURNING id`,
        ['Demo User', dummyEmail, hashedPassword]
      );
      const userId = userResult.rows[0].id;

      // Create streak
      await client.query(
        `INSERT INTO streaks (user_id, current_streak, longest_streak, last_activity_date) 
         VALUES ($1, 5, 5, CURRENT_DATE)`,
        [userId]
      );

      // Add dummy transactions
      const categoryResult = await client.query('SELECT id, name FROM categories');
      const catMap = {};
      categoryResult.rows.forEach(r => { catMap[r.name] = r.id; });

      const dummyTransactions = [
        { type: 'expense', amount: 15000, category: 'Makan', note: 'Nasi goreng', date: '2026-05-09' },
        { type: 'expense', amount: 8000, category: 'Transport', note: 'Gojek ke kampus', date: '2026-05-09' },
        { type: 'expense', amount: 25000, category: 'Jajan', note: 'Kopi susu', date: '2026-05-08' },
        { type: 'expense', amount: 50000, category: 'Nongkrong', note: 'Nongki sama temen', date: '2026-05-08' },
        { type: 'expense', amount: 35000, category: 'Top Up', note: 'Pulsa', date: '2026-05-07' },
        { type: 'expense', amount: 75000, category: 'Belanja', note: 'Indomaret', date: '2026-05-07' },
        { type: 'expense', amount: 12000, category: 'Makan', note: 'Bakso', date: '2026-05-06' },
        { type: 'expense', amount: 45000, category: 'Tagihan', note: 'Bayar listrik', date: '2026-05-06' },
        { type: 'income', amount: 3000000, category: 'Gaji', note: 'Gaji bulan Mei', date: '2026-05-01' },
        { type: 'income', amount: 500000, category: 'Freelance', note: 'Project design', date: '2026-05-05' },
        { type: 'expense', amount: 20000, category: 'Makan', note: 'Makan siang', date: '2026-05-10' },
        { type: 'expense', amount: 10000, category: 'Transport', note: 'Bensin', date: '2026-05-10' },
      ];

      for (const t of dummyTransactions) {
        await client.query(
          `INSERT INTO transactions (user_id, type, amount, category_id, note, date) 
           VALUES ($1, $2, $3, $4, $5, $6)`,
          [userId, t.type, t.amount, catMap[t.category], t.note, t.date]
        );
      }

      console.log('Dummy user created!');
      console.log('Email: demo@nabungo.app');
      console.log('Password: demo123');
    } else {
      console.log('Dummy user already exists.');
    }

    await client.query('COMMIT');
    console.log('Seeding completed successfully!');
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Seeding failed:', error);
    process.exit(1);
  } finally {
    client.release();
    await pool.end();
  }
}

seed();
