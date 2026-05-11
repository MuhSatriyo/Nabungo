const db = require('../config/database');
const challengeRepository = require('../repositories/challengeRepository');
const badgeRepository = require('../repositories/badgeRepository');
const streakRepository = require('../repositories/streakRepository');

const getXpAndLevel = async (userId) => {
  const result = await db.query(
    'SELECT xp, level FROM users WHERE id = $1', [userId]
  );
  return result.rows[0] || { xp: 0, level: 1 };
};

const addXp = async (userId, amount) => {
  const result = await db.query(
    `UPDATE users SET xp = xp + $2, 
     level = FLOOR(SQRT((xp + $2) / 100)) + 1
     WHERE id = $1 RETURNING xp, level`,
    [userId, amount]
  );
  return result.rows[0];
};

const checkAndAwardBadges = async (userId) => {
  const earned = [];
  const badges = await badgeRepository.findAll();

  for (const badge of badges) {
    let earned_badge = false;

    switch (badge.code) {
      case 'FIRST_TRANSACTION': {
        const result = await db.query(
          'SELECT COUNT(*) as count FROM transactions WHERE user_id = $1', [userId]
        );
        if (parseInt(result.rows[0].count) >= 1) earned_badge = true;
        break;
      }
      case 'STREAK_7': {
        const streak = await streakRepository.getCurrentStreak(userId);
        if (streak.current_streak >= 7) earned_badge = true;
        break;
      }
      case 'STREAK_30': {
        const streak = await streakRepository.getCurrentStreak(userId);
        if (streak.current_streak >= 30) earned_badge = true;
        break;
      }
      case 'BUDGET_MASTER': {
        const result = await db.query(
          `SELECT COUNT(*) as count FROM budgets WHERE user_id = $1`,
          [userId]
        );
        if (parseInt(result.rows[0].count) >= 3) earned_badge = true;
        break;
      }
      case 'SAVER': {
        const result = await db.query(
          `SELECT COALESCE(SUM(CASE WHEN type = 'income' THEN amount ELSE 0 END), 0) as income,
                  COALESCE(SUM(CASE WHEN type = 'expense' THEN amount ELSE 0 END), 0) as expense
           FROM transactions WHERE user_id = $1`,
          [userId]
        );
        const savings = parseFloat(result.rows[0].income) - parseFloat(result.rows[0].expense);
        if (savings > 0) earned_badge = true;
        break;
      }
      case 'CHALLENGER': {
        const result = await db.query(
          `SELECT COUNT(*) as count FROM user_challenges WHERE user_id = $1 AND status = 'completed'`,
          [userId]
        );
        if (parseInt(result.rows[0].count) >= 1) earned_badge = true;
        break;
      }
      case 'LEVEL_5': {
        const xpData = await getXpAndLevel(userId);
        if (parseInt(xpData.level) >= 5) earned_badge = true;
        break;
      }
      case 'LEVEL_10': {
        const xpData = await getXpAndLevel(userId);
        if (parseInt(xpData.level) >= 10) earned_badge = true;
        break;
      }
    }

    if (earned_badge) {
      try {
        await badgeRepository.awardBadge(userId, badge.id);
        earned.push(badge);
      } catch (e) {
        // Already earned
      }
    }
  }

  return earned;
};

const getGamificationStatus = async (userId) => {
  const xpData = await getXpAndLevel(userId);
  const badges = await badgeRepository.findByUser(userId);
  const currentStreak = await streakRepository.getCurrentStreak(userId);
  const activeChallenges = await challengeRepository.findActiveByUser(userId);

  return {
    xp: parseInt(xpData.xp),
    level: parseInt(xpData.level),
    xpForNextLevel: (parseInt(xpData.level) + 1) * 100,
    badges,
    streak: currentStreak,
    activeChallenges,
  };
};

const updateChallengeProgress = async (userId) => {
  const challenges = await challengeRepository.findActiveByUser(userId);
  for (const uc of challenges) {
    let current = uc.progress || 0;
    const requirementType = uc.requirement_type || 'transaction_count';
    const requirementValue = parseInt(uc.requirement_value || uc.days_required || 1);

    switch (requirementType) {
      case 'transaction_count': {
        const r = await db.query(
          'SELECT COUNT(*) as count FROM transactions WHERE user_id = $1',
          [userId]
        );
        current = Math.min(parseInt(r.rows[0].count), requirementValue);
        break;
      }
      case 'expense_total': {
        const r = await db.query(
          "SELECT COALESCE(SUM(amount), 0) as total FROM transactions WHERE user_id = $1 AND type = 'expense'",
          [userId]
        );
        current = Math.min(parseFloat(r.rows[0].total), requirementValue);
        break;
      }
      case 'income_total': {
        const r = await db.query(
          "SELECT COALESCE(SUM(amount), 0) as total FROM transactions WHERE user_id = $1 AND type = 'income'",
          [userId]
        );
        current = Math.min(parseFloat(r.rows[0].total), requirementValue);
        break;
      }
      case 'streak': {
        const streak = await streakRepository.getCurrentStreak(userId);
        current = Math.min(streak.current_streak || 0, requirementValue);
        break;
      }
      default:
        continue;
    }

    await challengeRepository.updateProgress(userId, uc.challenge_id, current);
  }
};

const claimChallenge = async (userId, challengeId) => {
  const challenge = await challengeRepository.findById(challengeId);
  if (!challenge) throw new Error('Challenge not found');

  const uc = await db.query(
    `SELECT * FROM user_challenges WHERE user_id = $1 AND challenge_id = $2 AND status = 'active'`,
    [userId, challengeId]
  );
  if (uc.rows.length === 0) throw new Error('Challenge not joined');

  const userChallenge = uc.rows[0];

  let requirementValue = parseInt(challenge.requirement_value || challenge.days_required || 1);
  if (userChallenge.progress < requirementValue) {
    throw new Error(`Progress ${userChallenge.progress}/${requirementValue} not complete yet`);
  }

  await challengeRepository.completeChallenge(userId, challengeId);
  const xpResult = await addXp(userId, challenge.xp_reward);
  await checkAndAwardBadges(userId);

  return {
    xpEarned: challenge.xp_reward,
    xp: parseInt(xpResult.xp),
    level: parseInt(xpResult.level),
  };
};

module.exports = { getXpAndLevel, addXp, checkAndAwardBadges, getGamificationStatus, updateChallengeProgress, claimChallenge };
