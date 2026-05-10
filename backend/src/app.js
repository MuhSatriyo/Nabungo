const express = require('express');
const morgan = require('morgan');
require('dotenv').config();

const authRoutes = require('./routes/auth');
const transactionRoutes = require('./routes/transactions');
const budgetRoutes = require('./routes/budgets');
const challengeRoutes = require('./routes/challenges');
const insightRoutes = require('./routes/insights');

const { securityHeaders, corsOptions, hidePoweredBy } = require('./middleware/security');
const { apiLimiter, authLimiter } = require('./middleware/rateLimiter');
const logger = require('./utils/logger');
const db = require('./config/database');

const app = express();

// Security
app.use(securityHeaders);
app.use(corsOptions);
app.use(hidePoweredBy);
app.disable('x-powered-by');

// Rate Limiting
app.use('/api', apiLimiter);
app.use('/api/auth/login', authLimiter);
app.use('/api/auth/register', authLimiter);

// Logging
app.use(morgan(process.env.NODE_ENV === 'production' ? 'combined' : 'dev', {
  stream: logger.stream,
}));

// Body parsing
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true, limit: '10mb' }));

// Trust proxy (for Nginx reverse proxy)
app.set('trust proxy', 1);

// API Routes
app.use('/api/auth', authRoutes);
app.use('/api/transactions', transactionRoutes);
app.use('/api/budgets', budgetRoutes);
app.use('/api/challenges', challengeRoutes);
app.use('/api/insights', insightRoutes);

// Health check with DB status
app.get('/api/health', async (req, res) => {
  try {
    await db.query('SELECT 1');
    res.json({
      status: 'healthy',
      timestamp: new Date().toISOString(),
      uptime: process.uptime(),
      database: 'connected',
      environment: process.env.NODE_ENV,
    });
  } catch (error) {
    res.status(503).json({
      status: 'unhealthy',
      timestamp: new Date().toISOString(),
      database: 'disconnected',
      environment: process.env.NODE_ENV,
    });
  }
});

// Ready check for load balancers
app.get('/api/ready', (req, res) => {
  res.json({ status: 'ready', timestamp: new Date().toISOString() });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({ error: 'Route not found' });
});

// Error handler
app.use((err, req, res, next) => {
  logger.error('Unhandled error:', {
    message: err.message,
    stack: err.stack,
    method: req.method,
    path: req.path,
    ip: req.ip,
  });

  const status = err.status || 500;
  const isDev = process.env.NODE_ENV === 'development';

  res.status(status).json({
    error: status === 500 ? 'Internal server error' : err.message,
    ...(isDev && { stack: err.stack }),
    requestId: req.id,
  });
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  logger.info(`${process.env.APP_NAME || 'Nabungo'} API started`, {
    port: PORT,
    environment: process.env.NODE_ENV || 'development',
  });
});

// Graceful shutdown
process.on('SIGTERM', async () => {
  logger.info('SIGTERM received. Shutting down gracefully...');
  await db.pool.end();
  process.exit(0);
});

process.on('SIGINT', async () => {
  logger.info('SIGINT received. Shutting down gracefully...');
  await db.pool.end();
  process.exit(0);
});

module.exports = app;
