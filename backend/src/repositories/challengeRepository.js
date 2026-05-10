const db = require('../config/database');

const findAll = async () => {
  const result = await db.query('SELECT * FROM challenges ORDER BY difficulty, title');
  return result.rows;
};

const findById = async (id) => {
  const result = await db.query('SELECT * FROM challenges WHERE id = $1', [id]);
  return result.rows[0];
};

const findActiveByUser = async (userId) => {
  const result = await db.query(
    `SELECT uc.*, c.title, c.description, c.difficulty, c.xp_reward, c.days_required, c.icon
     FROM user_challenges uc
     JOIN challenges c ON uc.challenge_id = c.id
     WHERE uc.user_id = $1 AND uc.status = 'active'
     ORDER BY uc.created_at DESC`,
    [userId]
  );
  return result.rows;
};

const joinChallenge = async (userId, challengeId) => {
  const result = await db.query(
    `INSERT INTO user_challenges (user_id, challenge_id, status) 
     VALUES ($1, $2, 'active') RETURNING *`,
    [userId, challengeId]
  );
  return result.rows[0];
};

const updateProgress = async (userId, challengeId, progress) => {
  const result = await db.query(
    `UPDATE user_challenges 
     SET progress = $3, updated_at = NOW() 
     WHERE user_id = $1 AND challenge_id = $2 RETURNING *`,
    [userId, challengeId, progress]
  );
  return result.rows[0];
};

const completeChallenge = async (userId, challengeId) => {
  const result = await db.query(
    `UPDATE user_challenges 
     SET status = 'completed', completed_at = NOW(), updated_at = NOW() 
     WHERE user_id = $1 AND challenge_id = $2 RETURNING *`,
    [userId, challengeId]
  );
  return result.rows[0];
};

module.exports = { findAll, findById, findActiveByUser, joinChallenge, updateProgress, completeChallenge };
