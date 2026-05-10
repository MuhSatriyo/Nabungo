const { generateInsights } = require('../utils/helpers');

const getInsights = async (userId) => {
  return generateInsights(userId);
};

module.exports = { getInsights };
