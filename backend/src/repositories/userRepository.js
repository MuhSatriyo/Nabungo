const db = require('../config/database');

const create = async (userData) => {
  const { name, email, password } = userData;
  const result = await db.query(
    `INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id, name, email, created_at`,
    [name, email, password]
  );
  return result.rows[0];
};

const findByEmail = async (email) => {
  const result = await db.query('SELECT * FROM users WHERE email = $1', [email]);
  return result.rows[0];
};

const findById = async (id) => {
  const result = await db.query(
    'SELECT id, name, email, avatar_url, created_at, updated_at FROM users WHERE id = $1',
    [id]
  );
  return result.rows[0];
};

const update = async (id, data) => {
  const fields = [];
  const values = [];
  let paramIndex = 1;

  for (const [key, value] of Object.entries(data)) {
    fields.push(`${key} = $${paramIndex}`);
    values.push(value);
    paramIndex++;
  }

  if (fields.length === 0) return null;

  values.push(id);
  const result = await db.query(
    `UPDATE users SET ${fields.join(', ')}, updated_at = NOW() WHERE id = $${paramIndex} 
     RETURNING id, name, email, avatar_url, created_at, updated_at`,
    values
  );
  return result.rows[0];
};

const deleteUser = async (id) => {
  await db.query('DELETE FROM users WHERE id = $1', [id]);
};

module.exports = { create, findByEmail, findById, update, deleteUser };
