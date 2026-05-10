const transactionRepository = require('../repositories/transactionRepository');
const { autoCategorize } = require('../utils/helpers');

const create = async (userId, data) => {
  let categoryId = data.category_id;

  if (!categoryId && data.note) {
    const autoCategory = autoCategorize(data.note);
    if (autoCategory) {
      const db = require('../config/database');
      const catResult = await db.query('SELECT id FROM categories WHERE LOWER(name) = LOWER($1)', [autoCategory]);
      if (catResult.rows.length > 0) {
        categoryId = catResult.rows[0].id;
      }
    }
  }

  if (!categoryId) {
    const db = require('../config/database');
    const defaultCat = await db.query(
      `SELECT id FROM categories WHERE LOWER(name) = LOWER($1)`,
      [data.type === 'income' ? 'Gaji' : 'Makan']
    );
    categoryId = defaultCat.rows[0]?.id;
  }

  return transactionRepository.create({
    user_id: userId,
    type: data.type,
    amount: data.amount,
    category_id: categoryId,
    note: data.note,
    date: data.date || new Date(),
  });
};

const getAll = async (userId, query) => {
  return transactionRepository.findAll(userId, query);
};

const getById = async (id, userId) => {
  const transaction = await transactionRepository.findById(id);
  if (!transaction || transaction.user_id !== userId) {
    throw { status: 404, message: 'Transaction not found' };
  }
  return transaction;
};

const update = async (id, userId, data) => {
  const transaction = await transactionRepository.findById(id);
  if (!transaction || transaction.user_id !== userId) {
    throw { status: 404, message: 'Transaction not found' };
  }

  let categoryId = data.category_id;
  if (!categoryId && data.note) {
    const autoCategory = autoCategorize(data.note);
    if (autoCategory) {
      const db = require('../config/database');
      const catResult = await db.query('SELECT id FROM categories WHERE LOWER(name) = LOWER($1)', [autoCategory]);
      if (catResult.rows.length > 0) {
        categoryId = catResult.rows[0].id;
      }
    }
  }

  return transactionRepository.update(id, userId, {
    ...data,
    ...(categoryId ? { category_id: categoryId } : {}),
  });
};

const remove = async (id, userId) => {
  const transaction = await transactionRepository.findById(id);
  if (!transaction || transaction.user_id !== userId) {
    throw { status: 404, message: 'Transaction not found' };
  }
  await transactionRepository.deleteTransaction(id, userId);
};

const getAnalytics = async (userId, period = 'month') => {
  const now = new Date();
  let startDate, endDate;

  switch (period) {
    case 'week': {
      const dayOfWeek = now.getDay();
      startDate = new Date(now);
      startDate.setDate(now.getDate() - dayOfWeek);
      startDate.setHours(0, 0, 0, 0);
      endDate = new Date(startDate);
      endDate.setDate(endDate.getDate() + 7);
      break;
    }
    case 'month':
      startDate = new Date(now.getFullYear(), now.getMonth(), 1);
      endDate = new Date(now.getFullYear(), now.getMonth() + 1, 1);
      break;
    case 'year':
      startDate = new Date(now.getFullYear(), 0, 1);
      endDate = new Date(now.getFullYear() + 1, 0, 1);
      break;
    default:
      startDate = new Date(now.getFullYear(), now.getMonth(), 1);
      endDate = new Date(now.getFullYear(), now.getMonth() + 1, 1);
  }

  const [summary, categories, weekly, daily] = await Promise.all([
    transactionRepository.getSummary(userId, startDate, endDate),
    transactionRepository.getCategorySummary(userId, startDate, endDate),
    transactionRepository.getWeeklySpending(userId, now.getFullYear(), now.getMonth() + 1),
    transactionRepository.getDailyTotals(userId, startDate, endDate),
  ]);

  return {
    summary: {
      total_expense: parseFloat(summary.total_expense),
      total_income: parseFloat(summary.total_income),
      transaction_count: parseInt(summary.transaction_count),
    },
    categories,
    weekly_spending: weekly,
    daily_totals: daily,
  };
};

module.exports = { create, getAll, getById, update, remove, getAnalytics };
