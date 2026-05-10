const db = require('../config/database');

const create = async (data) => {
  const { user_id, type, amount, category_id, note, date } = data;
  const result = await db.query(
    `INSERT INTO transactions (user_id, type, amount, category_id, note, date) 
     VALUES ($1, $2, $3, $4, $5, $6) RETURNING *`,
    [user_id, type, amount, category_id, note, date]
  );
  return result.rows[0];
};

const findAll = async (userId, { limit = 50, offset = 0, type, startDate, endDate, categoryId } = {}) => {
  let query = 'SELECT t.*, c.name as category_name, c.icon as category_icon, c.color as category_color FROM transactions t JOIN categories c ON t.category_id = c.id WHERE t.user_id = $1';
  const params = [userId];
  let paramIndex = 2;

  if (type) {
    query += ` AND t.type = $${paramIndex++}`;
    params.push(type);
  }
  if (startDate) {
    query += ` AND t.date >= $${paramIndex++}`;
    params.push(startDate);
  }
  if (endDate) {
    query += ` AND t.date <= $${paramIndex++}`;
    params.push(endDate);
  }
  if (categoryId) {
    query += ` AND t.category_id = $${paramIndex++}`;
    params.push(categoryId);
  }

  query += ' ORDER BY t.date DESC, t.created_at DESC';
  query += ` LIMIT $${paramIndex++} OFFSET $${paramIndex++}`;
  params.push(limit, offset);

  const result = await db.query(query, params);
  return result.rows;
};

const findById = async (id) => {
  const result = await db.query(
    'SELECT t.*, c.name as category_name, c.icon as category_icon FROM transactions t JOIN categories c ON t.category_id = c.id WHERE t.id = $1',
    [id]
  );
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

  if (fields.length === 0) return null;

  values.push(id, userId);
  const result = await db.query(
    `UPDATE transactions SET ${fields.join(', ')}, updated_at = NOW() 
     WHERE id = $${paramIndex} AND user_id = $${paramIndex + 1} RETURNING *`,
    values
  );
  return result.rows[0];
};

const deleteTransaction = async (id, userId) => {
  await db.query('DELETE FROM transactions WHERE id = $1 AND user_id = $2', [id, userId]);
};

const getSummary = async (userId, startDate, endDate) => {
  const result = await db.query(
    `SELECT 
      COALESCE(SUM(CASE WHEN type = 'expense' THEN amount ELSE 0 END), 0) as total_expense,
      COALESCE(SUM(CASE WHEN type = 'income' THEN amount ELSE 0 END), 0) as total_income,
      COUNT(*) as transaction_count
    FROM transactions 
    WHERE user_id = $1 AND date >= $2 AND date <= $3`,
    [userId, startDate, endDate]
  );
  return result.rows[0];
};

const getWeeklySpending = async (userId, year, month) => {
  const result = await db.query(
    `SELECT 
      EXTRACT(WEEK FROM date) as week_number,
      COALESCE(SUM(amount), 0) as total
    FROM transactions 
    WHERE user_id = $1 
      AND type = 'expense'
      AND EXTRACT(YEAR FROM date) = $2
      AND EXTRACT(MONTH FROM date) = $3
    GROUP BY EXTRACT(WEEK FROM date)
    ORDER BY week_number`,
    [userId, year, month]
  );
  return result.rows;
};

const getCategorySummary = async (userId, startDate, endDate) => {
  const result = await db.query(
    `SELECT 
      c.id, c.name, c.icon, c.color,
      COALESCE(SUM(t.amount), 0) as total,
      COUNT(t.id) as count
    FROM categories c
    LEFT JOIN transactions t ON c.id = t.category_id 
      AND t.user_id = $1 
      AND t.date >= $2 
      AND t.date <= $3
    GROUP BY c.id, c.name, c.icon, c.color
    ORDER BY total DESC`,
    [userId, startDate, endDate]
  );
  return result.rows;
};

const getDailyTotals = async (userId, startDate, endDate) => {
  const result = await db.query(
    `SELECT 
      date,
      COALESCE(SUM(CASE WHEN type = 'expense' THEN amount ELSE 0 END), 0) as expense,
      COALESCE(SUM(CASE WHEN type = 'income' THEN amount ELSE 0 END), 0) as income
    FROM transactions 
    WHERE user_id = $1 AND date >= $2 AND date <= $3
    GROUP BY date
    ORDER BY date`,
    [userId, startDate, endDate]
  );
  return result.rows;
};

module.exports = {
  create, findAll, findById, update, deleteTransaction,
  getSummary, getWeeklySpending, getCategorySummary, getDailyTotals,
};
