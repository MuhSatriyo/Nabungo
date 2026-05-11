const transactionService = require('../services/transactionService');
const streakRepository = require('../repositories/streakRepository');
const gamificationService = require('../services/gamificationService');

const create = async (req, res, next) => {
  try {
    const transaction = await transactionService.create(req.user.id, req.body);
    await streakRepository.updateStreak(req.user.id);
    await gamificationService.updateChallengeProgress(req.user.id);
    res.status(201).json({ success: true, data: transaction });
  } catch (error) {
    next(error);
  }
};

const getAll = async (req, res, next) => {
  try {
    const transactions = await transactionService.getAll(req.user.id, req.query);
    res.json({ success: true, data: transactions });
  } catch (error) {
    next(error);
  }
};

const getById = async (req, res, next) => {
  try {
    const transaction = await transactionService.getById(parseInt(req.params.id), req.user.id);
    res.json({ success: true, data: transaction });
  } catch (error) {
    next(error);
  }
};

const update = async (req, res, next) => {
  try {
    const transaction = await transactionService.update(parseInt(req.params.id), req.user.id, req.body);
    res.json({ success: true, data: transaction });
  } catch (error) {
    next(error);
  }
};

const remove = async (req, res, next) => {
  try {
    await transactionService.remove(parseInt(req.params.id), req.user.id);
    res.json({ success: true, message: 'Transaction deleted' });
  } catch (error) {
    next(error);
  }
};

const getAnalytics = async (req, res, next) => {
  try {
    const analytics = await transactionService.getAnalytics(req.user.id, req.query.period);
    res.json({ success: true, data: analytics });
  } catch (error) {
    next(error);
  }
};

const exportCSV = async (req, res, next) => {
  try {
    const csv = await transactionService.exportCSV(req.user.id, req.query);
    res.setHeader('Content-Type', 'text/csv; charset=utf-8');
    res.setHeader('Content-Disposition', 'attachment; filename="nabungo_transactions.csv"');
    res.send(csv);
  } catch (error) {
    next(error);
  }
};

module.exports = { create, getAll, getById, update, remove, getAnalytics, exportCSV };
