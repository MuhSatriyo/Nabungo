const db = require('../config/database');

const create = async (data) => {
  const { user_id, category_id, amount, month } = data;
  const result = await db.query(
    `INSERT INTO budgets (user_id, category_id, amount, month) 
     VALUES ($1, $2, $3, $4) RETURNING *`,
    [user_id, category_id, amount, month]
  );
  return result.rows[0];
};

const findByUserAndMonth = async (userId, month) => {
  const result = await db.query(
    `SELECT b.*, c.name as category_name, c.icon as category_icon 
     FROM budgets b 
     LEFT JOIN categories c ON b.category_id = c.id 
     WHERE b.user_id = $1 AND b.month = $2`,
    [userId, month]
  );
  return result.rows;
};

const findById = async (id) => {
  const result = await db.query('SELECT * FROM budgets WHERE id = $1', [id]);
  return result.rows[0];
};

const update = async (id, userId, data) => {
  const fields = [];
  const values = [];
  let paramIndex = 1;

  for (const [key, value] of Object.entries(data)) {
    fields.push(`${key} = $${paramIndex}`);
    values.push(value);
    paramIndex++;
  }

  values.push(id, userId);
  const result = await db.query(
    `UPDATE budgets SET ${fields.join(', ')}, updated_at = NOW() 
     WHERE id = $${paramIndex} AND user_id = $${paramIndex + 1} RETURNING *`,
    values
  );
  return result.rows[0];
};

const deleteBudget = async (id, userId) => {
  await db.query('DELETE FROM budgets WHERE id = $1 AND user_id = $2', [id, userId]);
};

const getBudgetProgress = async (userId, month) => {
  const result = await db.query(
    `SELECT 
      b.id, b.amount as budget_amount, b.category_id,
      c.name as category_name, c.icon as category_icon, c.color as category_color,
      COALESCE(SUM(t.amount), 0) as spent
    FROM budgets b
    JOIN categories c ON b.category_id = c.id
    LEFT JOIN transactions t ON b.category_id = t.category_id 
      AND t.user_id = b.user_id 
      AND t.type = 'expense'
      AND t.date >= b.month 
      AND t.date < b.month + INTERVAL '1 month'
    WHERE b.user_id = $1 AND b.month = $2
    GROUP BY b.id, b.amount, b.category_id, c.name, c.icon, c.color`,
    [userId, month]
  );
  return result.rows;
};

module.exports = { create, findByUserAndMonth, findById, update, deleteBudget, getBudgetProgress };
