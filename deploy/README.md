# Nabungo Production Deployment Guide

> Complete guide to deploy Nabungo to production Ubuntu 22.04 VPS using Docker.

## Architecture

```
┌─────────────────────────────────────────────────────┐
│                    User                              │
│              (Flutter Mobile App)                    │
└────────────────────┬────────────────────────────────┘
                     │ HTTPS
                     ▼
┌─────────────────────────────────────────────────────┐
│              Nginx Reverse Proxy                     │
│         (SSL Termination + Rate Limiting)            │
└────────────────────┬────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────┐
│              Express API (Node.js)                   │
│        (Business Logic + JWT Auth + Insights)        │
└────────────────────┬────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────┐
│              PostgreSQL 16                           │
│              (Primary Database)                      │
└─────────────────────────────────────────────────────┘
```

## Prerequisites

### Server Requirements
- Ubuntu 22.04 LTS
- Minimum 2GB RAM (4GB recommended)
- 2 CPU cores
- 20GB SSD storage
- Static public IP
- Domain name (e.g., api.nabungo.app, nabungo.app)
- Ports 80, 443 open

### Software to Install

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker

# Install Docker Compose
sudo apt install -y docker-compose-plugin

# Install Git
sudo apt install -y git

# Install Certbot (for SSL)
sudo apt install -y certbot python3-certbot-nginx
```

## Quick Deploy (Automated)

### 1. Clone Repository
```bash
cd /root
git clone https://github.com/MuhSatriyo/Nabungo.git nabungo
cd nabungo/deploy
```

### 2. Configure Environment
```bash
cp .env.example .env.production
nano .env.production
```

**Required changes in `.env.production`:**
| Variable | Description | Example |
|----------|-------------|---------|
| `DB_PASSWORD` | Database password (min 32 chars) | `v3ry_5tr0ng_p4ssw0rd_f0r_n4bung0_db` |
| `BACKUP_PASSWORD` | Backup user password | `b4ckup_p4ssw0rd_f0r_n4bung0` |
| `JWT_SECRET` | JWT signing secret (min 64 chars) | Random 64+ character string |
| `JWT_REFRESH_SECRET` | JWT refresh secret | Different random 64+ char string |
| `CORS_ORIGIN` | Allowed origins | `https://nabungo.app,https://api.nabungo.app` |

### 3. Setup SSL
```bash
# For production (Let's Encrypt)
chmod +x scripts/setup-ssl.sh
sudo ./scripts/setup-ssl.sh
# Select option 1 for Let's Encrypt

# For testing (self-signed)
sudo ./scripts/setup-ssl.sh
# Select option 2 for self-signed
```

### 4. Deploy
```bash
./scripts/deploy.sh deploy
```

### 5. Verify Deployment
```bash
# Check services
docker compose ps

# Check health
curl https://api.nabungo.app/api/health

# Check logs
docker compose logs nabungo-backend --tail=50
```

## Manual Deploy (Step by Step)

### 1. Database Setup
```bash
# Start PostgreSQL only
docker compose up -d nabungo-db

# Wait for database to be ready
docker compose exec nabungo-db pg_isready -U nabungo

# Run migrations
docker compose run --rm nabungo-backend node migrations/run.js

# Seed data
docker compose run --rm nabungo-backend node seeders/run.js
```

### 2. Backend Setup
```bash
# Build and start backend
docker compose build nabungo-backend
docker compose up -d nabungo-backend

# Check logs
docker compose logs -f nabungo-backend
```

### 3. Nginx Setup
```bash
# Create SSL certificates (see SSL setup section)
# Start Nginx
docker compose up -d nabungo-nginx
```

### 4. Full Stack Start
```bash
# Start all services
docker compose up -d

# Check all services
docker compose ps
```

## SSL/HTTPS Setup

### Let's Encrypt (Production)

```bash
# Run automated SSL setup
sudo ./scripts/setup-ssl.sh

# Or manually:
docker run --rm -p 80:80 -p 443:443 \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v ./docker/nginx/ssl:/ssl \
  certbot/certbot certonly --standalone \
  --non-interactive --agree-tos \
  --email admin@nabungo.app \
  --domains nabungo.app \
  --domains api.nabungo.app

# Copy certificates
cp -L /etc/letsencrypt/live/nabungo.app/fullchain.pem docker/nginx/ssl/certs/nabungo.crt
cp -L /etc/letsencrypt/live/nabungo.app/privkey.pem docker/nginx/ssl/private/nabungo.key

# Restart Nginx
docker compose restart nabungo-nginx
```

### Auto-Renewal
```bash
# The setup script creates a cron job automatically
# Verify:
crontab -l

# Manual renewal test:
docker run --rm -v /etc/letsencrypt:/etc/letsencrypt certbot/certbot renew --dry-run
```

## Database Management

### Backup
```bash
# Automated backup (runs daily at 3 AM via cron)
# Manual backup:
./scripts/deploy.sh backup

# Or directly:
docker compose exec nabungo-db /scripts/backup-db.sh
```

### Restore
```bash
# List available backups:
docker compose exec nabungo-db ls -lh /backups

# Restore from backup:
./scripts/deploy.sh restore nabungo_20250101_030000.sql.gz
```

## Logging & Monitoring

### Docker Logs
```bash
# All services
docker compose logs --tail=50 -f

# Specific service
docker compose logs nabungo-backend --tail=100 -f
docker compose logs nabungo-db --tail=50
docker compose logs nabungo-nginx --tail=50

# Backend application logs
docker compose exec nabungo-backend cat /app/logs/combined.log
docker compose exec nabungo-backend cat /app/logs/error.log
```

### Health Checks
```bash
# API health
curl https://api.nabungo.app/api/health

# Ready check
curl https://api.nabungo.app/api/ready

# Docker container health
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

## Security

### Production Security Checklist
- [ ] Strong passwords in `.env.production` (min 32 chars)
- [ ] JWT secrets are strong (min 64 chars)
- [ ] SSL/HTTPS enabled
- [ ] Database port not exposed publicly (127.0.0.1 only)
- [ ] Rate limiting enabled
- [ ] CORS configured correctly
- [ ] Helmet security headers enabled
- [ ] Docker containers run as non-root user
- [ ] Regular backups configured
- [ ] Failed login attempts monitored

### Firewall Setup
```bash
# UFW firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS
sudo ufw enable
```

## Flutter Production Build

### Build APK
```bash
cd frontend

# Development
API_BASE_URL=http://localhost:3000/api ./build-apk.sh apk

# Production
API_BASE_URL=https://api.nabungo.app/api ./build-apk.sh all
```

### Build App Bundle (Google Play)
```bash
API_BASE_URL=https://api.nabungo.app/api ./build-apk.sh aab
```

### Build iOS (Requires macOS)
```bash
API_BASE_URL=https://api.nabungo.app/api ./build-apk.sh ios
```

## CI/CD Pipeline

The project includes GitHub Actions at `.github/workflows/deploy.yml`:

### Pipeline Steps:
1. **Code Check**: Lint, audit dependencies
2. **Flutter Build**: Build APK + AAB
3. **Docker Build**: Build and push image to GHCR
4. **Deploy**: SSH into VPS, pull, restart containers
5. **Verify**: Health check endpoint
6. **Notify**: Status notification

### Setup GitHub Secrets:
| Secret | Description |
|--------|-------------|
| `VPS_SSH_KEY` | SSH private key for VPS access |
| `VPS_USER` | SSH user (usually `root`) |
| `VPS_HOST` | VPS IP address or hostname |

## Rollback

```bash
# Quick rollback
./scripts/deploy.sh rollback

# Manual rollback
cd /root/nabungo
git log --oneline -10
git revert <commit_hash>
cd deploy
./scripts/deploy.sh deploy
```

## Troubleshooting

### Database connection refused
```bash
# Check if database is running
docker compose ps nabungo-db

# Check database logs
docker compose logs nabungo-db

# Verify credentials in .env.production
grep DB_PASSWORD .env.production
```

### Backend unhealthy
```bash
# Check backend logs
docker compose logs nabungo-backend

# Test database connection from backend
docker compose exec nabungo-backend node -e "
  const db = require('./src/config/database');
  db.testConnection().then(console.log);
"

# Restart backend
docker compose restart nabungo-backend
```

### Nginx 502 Bad Gateway
```bash
# Check if backend is running
docker compose ps nabungo-backend

# Check nginx configuration
docker compose exec nabungo-nginx nginx -t

# Restart nginx
docker compose restart nabungo-nginx
```

### SSL Issues
```bash
# Check certificate expiry
openssl x509 -in docker/nginx/ssl/certs/nabungo.crt -text -noout | grep "Not After"

# Force renewal
docker run --rm -v /etc/letsencrypt:/etc/letsencrypt certbot/certbot renew --force-renewal
```

## Production Checklist

### Pre-Deployment
- [ ] Domain DNS pointing to VPS IP
- [ ] All `.env.production` secrets configured
- [ ] SSL certificates obtained
- [ ] Firewall configured
- [ ] SSH key-based authentication (no password)
- [ ] Docker installed and configured
- [ ] Git repository cloned

### Post-Deployment
- [ ] Health check endpoint returning 200
- [ ] API endpoints responding correctly
- [ ] Database connection established
- [ ] SSL certificate valid
- [ ] Auto-renewal cron job active
- [ ] Backup cron job active
- [ ] Monitoring alerts configured

### Maintenance
- [ ] Weekly backup verification
- [ ] Monthly SSL certificate check
- [ ] Quarterly dependency updates
- [ ] Regular Docker image cleanup (`docker system prune -f`)

## Directory Structure

```
nabungo/
├── backend/                    # Node.js API source
│   ├── src/
│   │   ├── config/            # Database & app config
│   │   ├── controllers/       # Route handlers
│   │   ├── middleware/        # Auth, validation, rate-limit
│   │   ├── repositories/     # Data access
│   │   ├── routes/           # API routes
│   │   ├── services/         # Business logic
│   │   └── utils/            # Helpers, logger
│   ├── migrations/           # SQL migrations
│   └── seeders/              # Initial data
├── deploy/
│   ├── docker/
│   │   ├── backend/Dockerfile    # Production Dockerfile
│   │   ├── nginx/nginx.conf      # Nginx config
│   │   └── postgres/init.sql    # DB init
│   ├── scripts/
│   │   ├── backup-db.sh         # Database backup
│   │   ├── restore-db.sh        # Database restore
│   │   ├── setup-ssl.sh         # SSL setup
│   │   └── deploy.sh            # Deploy manager
│   ├── .env.production          # Production env vars
│   ├── .env.example             # Environment template
│   └── docker-compose.yml       # Compose file
├── frontend/                   # Flutter app
│   ├── lib/
│   │   ├── core/
│   │   │   ├── constants/      # App constants
│   │   │   ├── theme/          # Dark/Light theme
│   │   │   ├── router/         # Navigation
│   │   │   └── network/        # API client
│   │   ├── data/models/        # Data models
│   │   └── presentation/       # UI screens
│   └── build-apk.sh            # Build script
└── .github/workflows/
    └── deploy.yml              # CI/CD pipeline
```

## Support

For issues and questions:
- GitHub Issues: https://github.com/MuhSatriyo/Nabungo/issues
- Email: admin@nabungo.app
