const insightService = require('../services/insightService');

const getInsights = async (req, res, next) => {
  try {
    const insights = await insightService.getInsights(req.user.id);
    res.json({ success: true, data: insights });
  } catch (error) {
    next(error);
  }
};

module.exports = { getInsights };
