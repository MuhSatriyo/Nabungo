const challengeRepository = require('../repositories/challengeRepository');
const gamificationService = require('../services/gamificationService');

const getAll = async (req, res, next) => {
  try {
    const challenges = await challengeRepository.findAll();
    res.json({ success: true, data: challenges });
  } catch (error) {
    next(error);
  }
};

const getActive = async (req, res, next) => {
  try {
    const challenges = await challengeRepository.findActiveByUser(req.user.id);
    res.json({ success: true, data: challenges });
  } catch (error) {
    next(error);
  }
};

const join = async (req, res, next) => {
  try {
    const challenge = await challengeRepository.joinChallenge(req.user.id, parseInt(req.params.id));
    res.json({ success: true, data: challenge });
  } catch (error) {
    next(error);
  }
};

const getGamificationStatus = async (req, res, next) => {
  try {
    const status = await gamificationService.getGamificationStatus(req.user.id);
    res.json({ success: true, data: status });
  } catch (error) {
    next(error);
  }
};

const claim = async (req, res, next) => {
  try {
    const result = await gamificationService.claimChallenge(req.user.id, parseInt(req.params.id));
    res.json({ success: true, data: result });
  } catch (error) {
    next(error);
  }
};

module.exports = { getAll, getActive, join, getGamificationStatus, claim };
