const express = require('express');
const router = express.Router();
const insightController = require('../controllers/insightController');
const { authenticate } = require('../middleware/auth');

router.use(authenticate);
router.get('/', insightController.getInsights);

module.exports = router;
