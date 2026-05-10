const db = require('../config/database');

const findAll = async () => {
  const result = await db.query('SELECT * FROM badges ORDER BY name');
  return result.rows;
};

const findByUser = async (userId) => {
  const result = await db.query(
    `SELECT b.*, ub.earned_at 
     FROM badges b
     JOIN user_badges ub ON b.id = ub.badge_id
     WHERE ub.user_id = $1
     ORDER BY ub.earned_at DESC`,
    [userId]
  );
  return result.rows;
};

const awardBadge = async (userId, badgeId) => {
  const existing = await db.query(
    'SELECT * FROM user_badges WHERE user_id = $1 AND badge_id = $2',
    [userId, badgeId]
  );
  if (existing.rows.length > 0) return existing.rows[0];

  const result = await db.query(
    `INSERT INTO user_badges (user_id, badge_id) VALUES ($1, $2) RETURNING *`,
    [userId, badgeId]
  );
  return result.rows[0];
};

const findById = async (id) => {
  const result = await db.query('SELECT * FROM badges WHERE id = $1', [id]);
  return result.rows[0];
};

module.exports = { findAll, findByUser, awardBadge, findById };
