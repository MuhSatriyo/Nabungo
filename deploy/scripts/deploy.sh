#!/bin/bash
#==========================================
# Nabungo Production Deploy Script
# Usage: ./deploy.sh [environment]
#==========================================

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

log() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Configuration
DEPLOY_DIR="/root/nabungo/deploy"
ENV_FILE="${DEPLOY_DIR}/.env.production"
COMPOSE_FILE="${DEPLOY_DIR}/docker-compose.yml"

# Check environment file
check_env() {
    if [ ! -f "$ENV_FILE" ]; then
        log "${RED}Error: .env.production not found at ${ENV_FILE}${NC}"
        log "Copy from .env.example and configure:"
        log "  cp ${DEPLOY_DIR}/.env.example ${ENV_FILE}"
        log "  nano ${ENV_FILE}"
        exit 1
    fi
    log "${GREEN}Environment file found.${NC}"
}

# Pull latest code
pull_latest() {
    log "Pulling latest code from repository..."
    cd /root/nabungo
    git pull origin main
    log "${GREEN}Code updated.${NC}"
}

# Build and deploy
deploy_stack() {
    log "Building and deploying Nabungo stack..."

    cd "$DEPLOY_DIR"

    # Pull latest images
    log "Pulling Docker images..."
    docker compose -f "$COMPOSE_FILE" pull

    # Build backend image
    log "Building backend image..."
    docker compose -f "$COMPOSE_FILE" build nabungo-backend

    # Start database first
    log "Starting database..."
    docker compose -f "$COMPOSE_FILE" up -d nabungo-db
    docker compose -f "$COMPOSE_FILE" exec -T nabungo-db pg_isready -U nabungo -t 30 || {
        log "${RED}Database failed to start.${NC}"
        exit 1
    }

    # Run migrations
    log "Running database migrations..."
    docker compose -f "$COMPOSE_FILE" run --rm nabungo-backend node migrations/run.js

    # Seed data (if first time)
    docker compose -f "$COMPOSE_FILE" run --rm nabungo-backend node seeders/run.js 2>/dev/null || true

    # Start remaining services
    log "Starting backend and nginx..."
    docker compose -f "$COMPOSE_FILE" up -d nabungo-backend nabungo-nginx

    # Wait for healthchecks
    log "Waiting for services to be healthy..."
    sleep 10

    # Check health
    HEALTH=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/api/health 2>/dev/null || echo "000")
    if [ "$HEALTH" = "200" ]; then
        log "${GREEN}Backend is healthy (HTTP 200)${NC}"
    else
        log "${YELLOW}Backend health check returned HTTP ${HEALTH}${NC}"
    fi

    log "${GREEN}Deployment completed successfully!${NC}"
}

# Show status
show_status() {
    cd "$DEPLOY_DIR"
    echo ""
    log "${CYAN}Service Status:${NC}"
    docker compose -f "$COMPOSE_FILE" ps

    echo ""
    log "${CYAN}Resource Usage:${NC}"
    docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}" $(docker compose -f "$COMPOSE_FILE" ps -q) 2>/dev/null || true
}

# Rollback
rollback() {
    log "${YELLOW}Rolling back to previous version...${NC}"
    cd /root/nabungo
    git revert HEAD --no-edit
    deploy_stack
    log "${GREEN}Rollback completed.${NC}"
}

# Show logs
show_logs() {
    local service="${1:-}"
    cd "$DEPLOY_DIR"
    if [ -n "$service" ]; then
        docker compose -f "$COMPOSE_FILE" logs --tail=100 -f "$service"
    else
        docker compose -f "$COMPOSE_FILE" logs --tail=50 -f
    fi
}

# Main menu
main() {
    echo ""
    echo "============================================="
    echo "  Nabungo Production Deployment Manager"
    echo "============================================="
    echo ""

    case "${1:-}" in
        deploy)
            check_env
            pull_latest
            deploy_stack
            show_status
            ;;
        status)
            show_status
            ;;
        logs)
            show_logs "${2:-}"
            ;;
        rollback)
            rollback
            ;;
        backup)
            cd "$DEPLOY_DIR"
            docker compose -f "$COMPOSE_FILE" exec nabungo-db /scripts/backup-db.sh
            ;;
        restore)
            cd "$DEPLOY_DIR"
            BACKUP_FILE="${2:-}"
            if [ -z "$BACKUP_FILE" ]; then
                log "Available backups:"
                docker compose -f "$COMPOSE_FILE" exec nabungo-db ls -lh /backups/*.sql.gz 2>/dev/null || true
                echo ""
                read -p "Enter backup filename: " BACKUP_FILE
            fi
            docker compose -f "$COMPOSE_FILE" exec -T nabungo-db /scripts/restore-db.sh "/backups/${BACKUP_FILE}"
            ;;
        *)
            echo "Usage: $0 [command]"
            echo ""
            echo "Commands:"
            echo "  deploy          Full deployment (pull, build, migrate, start)"
            echo "  status          Show service status"
            echo "  logs [service]  Show logs"
            echo "  rollback        Rollback to previous version"
            echo "  backup          Backup database"
            echo "  restore [file]  Restore database"
            echo ""
            echo "Examples:"
            echo "  $0 deploy"
            echo "  $0 status"
            echo "  $0 logs nabungo-backend"
            echo "  $0 backup"
            ;;
    esac
}

main "$@"
