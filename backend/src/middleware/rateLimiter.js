const rateLimit = require('express-rate-limit');

const createRateLimiter = (options = {}) => {
  return rateLimit({
    windowMs: options.windowMs || parseInt(process.env.RATE_LIMIT_WINDOW_MS) || 15 * 60 * 1000,
    max: options.max || parseInt(process.env.RATE_LIMIT_MAX) || 100,
    message: {
      error: 'Too many requests, please try again later.',
      retryAfter: '{{retryAfter}}',
    },
    standardHeaders: true,
    legacyHeaders: false,
    keyGenerator: (req) => {
      return req.ip || req.connection.remoteAddress;
    },
    handler: (req, res, next, options) => {
      res.status(429).json({
        error: 'Too many requests. Please slow down.',
        retryAfter: Math.ceil(options.windowMs / 1000),
      });
    },
    ...options,
  });
};

// Strict limiter for auth endpoints
const authLimiter = createRateLimiter({
  windowMs: 15 * 60 * 1000,
  max: 10,
  message: {
    error: 'Too many login attempts. Please try again after 15 minutes.',
  },
});

// General API limiter
const apiLimiter = createRateLimiter({
  windowMs: 15 * 60 * 1000,
  max: 100,
});

module.exports = { createRateLimiter, authLimiter, apiLimiter };
