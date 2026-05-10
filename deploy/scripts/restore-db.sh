#!/bin/bash
#==========================================
# Nabungo Database Restore Script
# Usage: ./restore-db.sh [backup_file]
#==========================================

set -euo pipefail

# Configuration
BACKUP_FILE="${1:-}"
DB_HOST="${DB_HOST:-nabungo-db}"
DB_PORT="${DB_PORT:-5432}"
DB_NAME="${DB_NAME:-nabungo}"
DB_USER="${DB_USER:-nabungo}"
DB_PASSWORD="${DB_PASSWORD:-}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Check if backup file provided
if [ -z "$BACKUP_FILE" ]; then
    log "${RED}Error: No backup file specified.${NC}"
    log "Usage: $0 [backup_file]"
    log "  backup_file: Path to backup file (.sql.gz or .dump)"
    log ""
    log "Available backups:"
    ls -lh /backups/nabungo_*.sql.gz 2>/dev/null || echo "  No backups found"
    exit 1
fi

# Check if backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
    log "${RED}Error: Backup file not found: ${BACKUP_FILE}${NC}"
    exit 1
fi

log "${YELLOW}========================================${NC}"
log "${YELLOW}WARNING: DATABASE RESTORE IN PROGRESS${NC}"
log "${YELLOW}========================================${NC}"
log "This will COMPLETELY OVERWRITE the database '${DB_NAME}'"
log ""
log "Backup file: ${BACKUP_FILE}"
log "Target database: ${DB_NAME} on ${DB_HOST}:${DB_PORT}"
log ""

# Confirmation
read -p "Are you sure you want to continue? (type 'yes' to confirm): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
    log "${RED}Restore cancelled.${NC}"
    exit 1
fi

# Export password
export PGPASSWORD="$DB_PASSWORD"

# Check if pg_restore is available
if command -v pg_restore >/dev/null 2>&1; then
    RESTORE_CMD="pg_restore"
elif command -v psql >/dev/null 2>&1; then
    RESTORE_CMD="psql"
else
    log "${RED}Error: Neither pg_restore nor psql found.${NC}"
    exit 1
fi

log "${GREEN}Starting restore from: ${BACKUP_FILE}${NC}"

# Terminate existing connections
log "Terminating existing connections to ${DB_NAME}..."
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d postgres -c "
    SELECT pg_terminate_backend(pg_stat_activity.pid)
    FROM pg_stat_activity
    WHERE pg_stat_activity.datname = '${DB_NAME}'
      AND pid <> pg_backend_pid();
" 2>/dev/null || true

# Drop and recreate database
log "Recreating database..."
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d postgres -c "DROP DATABASE IF EXISTS ${DB_NAME};" 2>/dev/null || true
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d postgres -c "CREATE DATABASE ${DB_NAME};"

# Perform restore
log "Restoring data..."
RESTORE_START=$(date +%s)

case "$BACKUP_FILE" in
    *.gz)
        log "Detected gzip compressed backup"
        if [ "$RESTORE_CMD" = "pg_restore" ]; then
            gunzip -c "$BACKUP_FILE" | pg_restore -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" --verbose --no-owner --no-acl 2>&1
        else
            gunzip -c "$BACKUP_FILE" | psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" 2>&1
        fi
        ;;
    *.dump|*.sql)
        if [ "$RESTORE_CMD" = "pg_restore" ]; then
            pg_restore -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" --verbose --no-owner --no-acl "$BACKUP_FILE" 2>&1
        else
            psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" < "$BACKUP_FILE" 2>&1
        fi
        ;;
    *)
        log "${RED}Unknown backup format: ${BACKUP_FILE}${NC}"
        log "Supported formats: .sql.gz, .dump, .sql"
        exit 1
        ;;
esac

if [ $? -eq 0 ]; then
    RESTORE_END=$(date +%s)
    DURATION=$((RESTORE_END - RESTORE_START))
    log "${GREEN}Restore completed successfully in ${DURATION} seconds!${NC}"

    # Run migrations after restore
    log "Running migrations..."
    psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f /app/migrations/001_initial.sql 2>/dev/null || true

    log "${GREEN}Database restore completed.${NC}"
else
    log "${RED}Restore failed!${NC}"
    exit 1
fi

# Unset password
unset PGPASSWORD

log "${GREEN}Restore process completed.${NC}"
