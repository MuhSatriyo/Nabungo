const budgetService = require('../services/budgetService');

const create = async (req, res, next) => {
  try {
    const budget = await budgetService.create(req.user.id, req.body);
    res.status(201).json({ success: true, data: budget });
  } catch (error) {
    next(error);
  }
};

const getByMonth = async (req, res, next) => {
  try {
    const data = await budgetService.getByMonth(req.user.id, req.query.month);
    res.json({ success: true, data });
  } catch (error) {
    next(error);
  }
};

const update = async (req, res, next) => {
  try {
    const budget = await budgetService.update(parseInt(req.params.id), req.user.id, req.body);
    res.json({ success: true, data: budget });
  } catch (error) {
    next(error);
  }
};

const remove = async (req, res, next) => {
  try {
    await budgetService.remove(parseInt(req.params.id), req.user.id);
    res.json({ success: true, message: 'Budget deleted' });
  } catch (error) {
    next(error);
  }
};

const getAlerts = async (req, res, next) => {
  try {
    const alerts = await budgetService.getBudgetAlerts(req.user.id);
    res.json({ success: true, data: alerts });
  } catch (error) {
    next(error);
  }
};

module.exports = { create, getByMonth, update, remove, getAlerts };
