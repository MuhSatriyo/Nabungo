const express = require('express');
const router = express.Router();
const challengeController = require('../controllers/challengeController');
const { authenticate } = require('../middleware/auth');

router.use(authenticate);

router.get('/', challengeController.getAll);
router.get('/active', challengeController.getActive);
router.get('/gamification', challengeController.getGamificationStatus);
router.post('/:id/join', challengeController.join);
router.post('/:id/claim', challengeController.claim);

module.exports = router;
