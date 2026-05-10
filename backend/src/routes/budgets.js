const express = require('express');
const { body } = require('express-validator');
const router = express.Router();
const budgetController = require('../controllers/budgetController');
const { authenticate } = require('../middleware/auth');
const { validate } = require('../middleware/validation');

router.use(authenticate);

router.post('/', [
  body('category_id').isInt().withMessage('Category ID is required'),
  body('amount').isFloat({ min: 0 }).withMessage('Amount must be positive'),
  validate,
], budgetController.create);

router.get('/', budgetController.getByMonth);
router.get('/alerts', budgetController.getAlerts);
router.put('/:id', budgetController.update);
router.delete('/:id', budgetController.remove);

module.exports = router;
