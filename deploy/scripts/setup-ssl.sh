#!/bin/bash
#==========================================
# Nabungo SSL Setup Script
# Uses Let's Encrypt (Certbot) for SSL
#==========================================

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Check requirements
check_requirements() {
    log "${GREEN}Checking requirements...${NC}"

    if ! command -v docker &> /dev/null; then
        log "${RED}Docker is not installed. Please install Docker first.${NC}"
        exit 1
    fi

    if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
        log "${RED}Docker Compose is not installed.${NC}"
        exit 1
    fi

    log "${GREEN}All requirements met.${NC}"
}

# Setup SSL with Let's Encrypt
setup_letsencrypt() {
    log "${GREEN}Setting up Let's Encrypt SSL...${NC}"

    # Configuration
    DOMAIN="${DOMAIN:-nabungo.app}"
    API_DOMAIN="${API_DOMAIN:-api.nabungo.app}"
    EMAIL="${EMAIL:-admin@nabungo.app}"
    CONFIG_DIR="/etc/letsencrypt"
    SSL_DIR="./docker/nginx/ssl"

    # Create SSL directory
    mkdir -p "$SSL_DIR"/{certs,private}

    # Stop Nginx if running
    docker-compose stop nabungo-nginx 2>/dev/null || true

    # Run Certbot
    log "Obtaining SSL certificate for ${DOMAIN} and ${API_DOMAIN}..."

    docker run --rm \
        -p 80:80 \
        -p 443:443 \
        -v "${CONFIG_DIR}:/etc/letsencrypt" \
        -v "${SSL_DIR}:/ssl" \
        certbot/certbot \
        certonly \
        --standalone \
        --non-interactive \
        --agree-tos \
        --email "${EMAIL}" \
        --domains "${DOMAIN}" \
        --domains "${API_DOMAIN}" \
        --expand

    # Copy certificates to nginx SSL directory
    log "Copying certificates to Nginx SSL directory..."
    cp -L "${CONFIG_DIR}/live/${DOMAIN}/fullchain.pem" "${SSL_DIR}/certs/nabungo.crt" 2>/dev/null || \
    cp -L "${CONFIG_DIR}/live/${API_DOMAIN}/fullchain.pem" "${SSL_DIR}/certs/nabungo.crt" 2>/dev/null || true

    cp -L "${CONFIG_DIR}/live/${DOMAIN}/privkey.pem" "${SSL_DIR}/private/nabungo.key" 2>/dev/null || \
    cp -L "${CONFIG_DIR}/live/${API_DOMAIN}/privkey.pem" "${SSL_DIR}/private/nabungo.key" 2>/dev/null || true

    # Set permissions
    chmod 644 "${SSL_DIR}/certs/nabungo.crt"
    chmod 600 "${SSL_DIR}/private/nabungo.key"

    log "${GREEN}SSL certificates obtained successfully!${NC}"
}

# Setup auto-renewal cron job
setup_auto_renewal() {
    log "Setting up auto-renewal cron job..."

    CRON_JOB="0 3 * * * docker run --rm -v /etc/letsencrypt:/etc/letsencrypt certbot/certbot renew --quiet && cd /root/nabungo/deploy && docker-compose exec nabungo-nginx nginx -s reload"

    # Add to crontab if not already present
    (crontab -l 2>/dev/null | grep -v "certbot/certbot renew" || true; echo "$CRON_JOB") | crontab -

    log "${GREEN}Auto-renewal cron job installed.${NC}"
}

# Setup using self-signed (for testing)
setup_self_signed() {
    log "${YELLOW}Setting up self-signed certificate (for testing)...${NC}"

    DOMAIN="${DOMAIN:-nabungo.local}"
    SSL_DIR="./docker/nginx/ssl"
    mkdir -p "$SSL_DIR"/{certs,private}

    docker run --rm \
        -v "${SSL_DIR}/certs:/certs" \
        -v "${SSL_DIR}/private:/private" \
        alpine/openssl \
        req -x509 \
        -nodes \
        -days 365 \
        -newkey rsa:2048 \
        -keyout /private/nabungo.key \
        -out /certs/nabungo.crt \
        -subj "/CN=${DOMAIN}/O=Nabungo/C=ID"

    chmod 644 "${SSL_DIR}/certs/nabungo.crt"
    chmod 600 "${SSL_DIR}/private/nabungo.key"

    log "${YELLOW}Self-signed certificate created. Use Let's Encrypt for production.${NC}"
}

# Main
main() {
    echo ""
    echo "============================================="
    echo "  Nabungo SSL Setup"
    echo "============================================="
    echo ""

    check_requirements

    echo "Choose SSL setup type:"
    echo "  1) Let's Encrypt (Production)"
    echo "  2) Self-signed (Testing)"
    echo "  3) Skip"
    echo ""
    read -p "Select option [1-3]: " OPTION

    case $OPTION in
        1)
            setup_letsencrypt
            setup_auto_renewal
            ;;
        2)
            setup_self_signed
            ;;
        3)
            log "${YELLOW}SSL setup skipped.${NC}"
            ;;
        *)
            log "${RED}Invalid option.${NC}"
            exit 1
            ;;
    esac

    # Start Nginx
    log "Starting Nginx..."
    cd /root/nabungo/deploy
    docker-compose up -d nabungo-nginx

    log "${GREEN}SSL setup completed!${NC}"
    echo ""
    echo "Certificate: ./docker/nginx/ssl/certs/nabungo.crt"
    echo "Private key: ./docker/nginx/ssl/private/nabungo.key"
    echo ""
}

main
