const budgetRepository = require('../repositories/budgetRepository');
const { getDateRange } = require('../utils/helpers');

const create = async (userId, data) => {
  return budgetRepository.create({
    user_id: userId,
    category_id: data.category_id,
    amount: data.amount,
    month: data.month || new Date(),
  });
};

const getByMonth = async (userId, month) => {
  const date = month ? new Date(month) : new Date();
  const startOfMonth = new Date(date.getFullYear(), date.getMonth(), 1);

  const budgets = await budgetRepository.findByUserAndMonth(userId, startOfMonth);
  const progress = await budgetRepository.getBudgetProgress(userId, startOfMonth);

  return { budgets, progress };
};

const update = async (id, userId, data) => {
  const budget = await budgetRepository.findById(id);
  if (!budget || budget.user_id !== userId) {
    throw { status: 404, message: 'Budget not found' };
  }
  return budgetRepository.update(id, userId, data);
};

const remove = async (id, userId) => {
  const budget = await budgetRepository.findById(id);
  if (!budget || budget.user_id !== userId) {
    throw { status: 404, message: 'Budget not found' };
  }
  await budgetRepository.deleteBudget(id, userId);
};

const getBudgetAlerts = async (userId) => {
  const now = new Date();
  const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);

  const progress = await budgetRepository.getBudgetProgress(userId, startOfMonth);
  const alerts = [];

  for (const item of progress) {
    const spent = parseFloat(item.spent);
    const budgetAmount = parseFloat(item.budget_amount);
    const percentage = budgetAmount > 0 ? (spent / budgetAmount) * 100 : 0;

    if (percentage >= 90) {
      alerts.push({
        type: 'danger',
        category: item.category_name,
        message: `Budget ${item.category_name} hampir habis! (${percentage.toFixed(0)}%)`,
        percentage,
      });
    } else if (percentage >= 75) {
      alerts.push({
        type: 'warning',
        category: item.category_name,
        message: `Budget ${item.category_name} tersisa ${(100 - percentage).toFixed(0)}%`,
        percentage,
      });
    }
  }

  return alerts;
};

module.exports = { create, getByMonth, update, remove, getBudgetAlerts };
