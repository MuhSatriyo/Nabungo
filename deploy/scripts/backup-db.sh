#!/bin/bash
#==========================================
# Nabungo Database Backup Script
# Usage: ./backup-db.sh [backup_dir]
#==========================================

set -euo pipefail

# Configuration
BACKUP_DIR="${1:-/backups}"
DB_HOST="${DB_HOST:-nabungo-db}"
DB_PORT="${DB_PORT:-5432}"
DB_NAME="${DB_NAME:-nabungo}"
DB_USER="${DB_USER:-nabungo}"
DB_PASSWORD="${DB_PASSWORD:-}"
RETENTION_DAYS="${BACKUP_RETENTION_DAYS:-30}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/nabungo_${TIMESTAMP}.sql.gz"
LATEST_LINK="${BACKUP_DIR}/nabungo_latest.sql.gz"
LOG_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "${GREEN}Starting Nabungo database backup...${NC}"

# Check required tools
command -v pg_dump >/dev/null 2>&1 || { log "${RED}Error: pg_dump is required but not installed.${NC}"; exit 1; }
command -v gzip >/dev/null 2>&1 || { log "${RED}Error: gzip is required but not installed.${NC}"; exit 1; }

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Export password for pg_dump
export PGPASSWORD="$DB_PASSWORD"

# Perform backup
log "Backing up database: ${DB_NAME} on ${DB_HOST}:${DB_PORT}"

pg_dump \
    -h "$DB_HOST" \
    -p "$DB_PORT" \
    -U "$DB_USER" \
    -d "$DB_NAME" \
    --format=custom \
    --verbose \
    --no-owner \
    --no-acl \
    --compress=9 \
    --file="${BACKUP_FILE}" \
    2>&1 | tee -a "$LOG_FILE"

if [ $? -eq 0 ]; then
    BACKUP_SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    log "${GREEN}Backup completed successfully: ${BACKUP_FILE} (${BACKUP_SIZE})${NC}"

    # Create/update latest symlink
    ln -sf "$BACKUP_FILE" "$LATEST_LINK"
    log "Updated latest backup symlink"

    # Cleanup old backups
    log "Cleaning up backups older than ${RETENTION_DAYS} days..."
    find "$BACKUP_DIR" -name "nabungo_*.sql.gz" -type f -mtime "+${RETENTION_DAYS}" -delete
    find "$BACKUP_DIR" -name "backup_*.log" -type f -mtime "+${RETENTION_DAYS}" -delete
    log "${GREEN}Cleanup completed${NC}"

    # Print backup info
    echo ""
    log "${GREEN}========================================${NC}"
    log "${GREEN}Backup Summary:${NC}"
    log "  Database: ${DB_NAME}"
    log "  File: ${BACKUP_FILE}"
    log "  Size: ${BACKUP_SIZE}"
    log "  Retention: ${RETENTION_DAYS} days"
    log "${GREEN}========================================${NC}"

    # List recent backups
    echo ""
    log "Recent backups:"
    ls -lh "$BACKUP_DIR"/nabungo_*.sql.gz 2>/dev/null | head -5 | while read line; do
        log "  $line"
    done
else
    log "${RED}Backup failed!${NC}"
    rm -f "$BACKUP_FILE"
    exit 1
fi

# Unset password
unset PGPASSWORD

log "${GREEN}Backup process completed.${NC}"
