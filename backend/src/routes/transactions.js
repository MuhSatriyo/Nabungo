const express = require('express');
const { body } = require('express-validator');
const router = express.Router();
const transactionController = require('../controllers/transactionController');
const { authenticate } = require('../middleware/auth');
const { validate } = require('../middleware/validation');

router.use(authenticate);

router.post('/', [
  body('type').isIn(['expense', 'income']).withMessage('Type must be expense or income'),
  body('amount').isFloat({ min: 0 }).withMessage('Amount must be positive'),
  body('category_id').optional().isInt(),
  body('note').optional().trim(),
  body('date').optional().isISO8601(),
  validate,
], transactionController.create);

router.get('/', transactionController.getAll);
router.get('/export', transactionController.exportCSV);
router.get('/analytics', transactionController.getAnalytics);
router.get('/:id', transactionController.getById);
router.put('/:id', transactionController.update);
router.delete('/:id', transactionController.remove);

module.exports = router;
