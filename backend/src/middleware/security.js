const helmet = require('helmet');
const cors = require('cors');

const securityHeaders = helmet({
  contentSecurityPolicy: process.env.NODE_ENV === 'production' ? {
    directives: {
      defaultSrc: ["'self'"],
      scriptSrc: ["'self'"],
      styleSrc: ["'self'", "'unsafe-inline'"],
      imgSrc: ["'self'", 'data:'],
      connectSrc: ["'self'", process.env.CORS_ORIGIN || 'https://nabungo.app'],
    },
  } : false,
  crossOriginEmbedderPolicy: false,
  crossOriginResourcePolicy: { policy: 'cross-origin' },
});

const corsOptions = cors({
  origin: process.env.NODE_ENV === 'production'
    ? (process.env.CORS_ORIGIN || 'https://nabungo.app').split(',').map(s => s.trim())
    : '*',
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With'],
  exposedHeaders: ['X-RateLimit-Limit', 'X-RateLimit-Remaining'],
  maxAge: 86400,
});

const hidePoweredBy = (req, res, next) => {
  res.removeHeader('X-Powered-By');
  next();
};

module.exports = { securityHeaders, corsOptions, hidePoweredBy };
