const { Pool, types } = require('pg');
const logger = require('../utils/logger');
require('dotenv').config();

// Parse numeric/decimal types as numbers instead of strings
types.setTypeParser(1700, (val) => parseFloat(val)); // NUMERIC
types.setTypeParser(20, (val) => parseInt(val, 10)); // INT8 (BIGINT)

const poolConfig = {
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT) || 5432,
  database: process.env.DB_NAME || 'nabungo',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
  max: parseInt(process.env.DB_POOL_MAX) || 20,
  min: parseInt(process.env.DB_POOL_MIN) || 2,
  idleTimeoutMillis: parseInt(process.env.DB_IDLE_TIMEOUT) || 30000,
  connectionTimeoutMillis: parseInt(process.env.DB_CONNECTION_TIMEOUT) || 5000,
  query_timeout: 10000,
  statement_timeout: 15000,
  application_name: 'nabungo_api',
};

if (process.env.NODE_ENV === 'production') {
  poolConfig.ssl = process.env.DB_SSL === 'true' ? { rejectUnauthorized: true } : false;
}

const pool = new Pool(poolConfig);

pool.on('error', (err) => {
  logger.error('Unexpected error on idle database client', { error: err.message });
});

pool.on('connect', () => {
  logger.debug('New database client acquired from pool');
});

pool.on('remove', () => {
  logger.debug('Database client removed from pool');
});

const query = async (text, params) => {
  const start = Date.now();
  try {
    const result = await pool.query(text, params);
    const duration = Date.now() - start;
    if (duration > 1000) {
      logger.warn('Slow query detected', {
        query: text.substring(0, 100),
        duration: `${duration}ms`,
      });
    }
    return result;
  } catch (error) {
    logger.error('Query error', {
      query: text.substring(0, 100),
      error: error.message,
    });
    throw error;
  }
};

const getClient = () => pool.connect();

const testConnection = async () => {
  try {
    await query('SELECT 1');
    logger.info('Database connection established successfully');
    return true;
  } catch (error) {
    logger.error('Database connection failed', { error: error.message });
    return false;
  }
};

module.exports = { pool, query, getClient, testConnection };
