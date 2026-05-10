const db = require('../config/database');

const create = async (userId) => {
  const result = await db.query(
    `INSERT INTO streaks (user_id, current_streak, longest_streak, last_activity_date) 
     VALUES ($1, 0, 0, CURRENT_DATE) RETURNING *`,
    [userId]
  );
  return result.rows[0];
};

const getCurrentStreak = async (userId) => {
  const result = await db.query(
    'SELECT * FROM streaks WHERE user_id = $1',
    [userId]
  );

  if (result.rows.length === 0) {
    return create(userId);
  }
  return result.rows[0];
};

const updateStreak = async (userId) => {
  const streak = await getCurrentStreak(userId);
  const lastDate = new Date(streak.last_activity_date);
  const today = new Date();
  today.setHours(0, 0, 0, 0);

  const diffDays = Math.floor((today - lastDate) / (1000 * 60 * 60 * 24));

  if (diffDays === 0) {
    return streak; // Already logged today
  }

  let newStreak;
  if (diffDays === 1) {
    newStreak = streak.current_streak + 1;
  } else {
    newStreak = 1; // Reset streak
  }

  const longestStreak = Math.max(newStreak, streak.longest_streak);

  const result = await db.query(
    `UPDATE streaks 
     SET current_streak = $2, longest_streak = $3, last_activity_date = CURRENT_DATE, updated_at = NOW()
     WHERE user_id = $1 RETURNING *`,
    [userId, newStreak, longestStreak]
  );
  return result.rows[0];
};

module.exports = { create, getCurrentStreak, updateStreak };
