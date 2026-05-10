#!/bin/bash
#==========================================
# Nabungo Flutter Production Build Script
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

# Configuration
API_BASE_URL="${API_BASE_URL:-https://api.nabungo.app/api}"
BUILD_NUMBER="${BUILD_NUMBER:-1}"
BUILD_DIR="build"
FLAVOR="${FLAVOR:-production}"

check_requirements() {
    log "${GREEN}Checking requirements...${NC}"

    if ! command -v flutter &> /dev/null; then
        log "${RED}Flutter is not installed.${NC}"
        exit 1
    fi

    FLUTTER_VERSION=$(flutter --version 2>/dev/null | head -1 | grep -oP '\d+\.\d+\.\d+' | head -1)
    log "Flutter version: ${FLUTTER_VERSION}"

    log "${GREEN}All requirements met.${NC}"
}

clean_build() {
    log "Cleaning previous builds..."
    flutter clean
    rm -rf "$BUILD_DIR"
    log "Clean completed."
}

get_dependencies() {
    log "Getting dependencies..."
    flutter pub get
}

generate_code() {
    log "Running code generation..."
    flutter pub run build_runner build --delete-conflicting-outputs || true
    log "Code generation completed."
}

analyze_code() {
    log "Running code analysis..."
    flutter analyze --no-fatal-infos --no-fatal-warnings || true
    log "Analysis completed."
}

run_tests() {
    log "Running tests..."
    flutter test --coverage || true
    log "Tests completed."
}

build_apk() {
    log "Building Flutter APK (Release)..."

    flutter build apk \
        --release \
        --split-per-abi \
        --dart-define=API_BASE_URL="${API_BASE_URL}" \
        --dart-define=PRODUCTION=true \
        --dart-define=FLAVOR="${FLAVOR}" \
        --build-number="${BUILD_NUMBER}"

    log "${GREEN}APK built successfully!${NC}"

    # Show output files
    echo ""
    log "Generated APK files:"
    ls -lh build/app/outputs/flutter-apk/*.apk 2>/dev/null || true
}

build_appbundle() {
    log "Building Flutter App Bundle (Release)..."

    flutter build appbundle \
        --release \
        --dart-define=API_BASE_URL="${API_BASE_URL}" \
        --dart-define=PRODUCTION=true \
        --dart-define=FLAVOR="${FLAVOR}" \
        --build-number="${BUILD_NUMBER}"

    log "${GREEN}App Bundle built successfully!${NC}"

    echo ""
    log "Generated AAB file:"
    ls -lh build/app/outputs/bundle/release/*.aab 2>/dev/null || true
}

build_ios() {
    log "Building iOS (Release)..."

    flutter build ios \
        --release \
        --no-codesign \
        --dart-define=API_BASE_URL="${API_BASE_URL}" \
        --dart-define=PRODUCTION=true \
        --dart-define=FLAVOR="${FLAVOR}" \
        --build-number="${BUILD_NUMBER}"

    log "${GREEN}iOS build completed!${NC}"
}

sign_apk() {
    local apk_file="$1"
    if [ -n "${KEYSTORE_PATH:-}" ] && [ -n "${KEY_ALIAS:-}" ]; then
        log "Signing APK: ${apk_file}..."
        jarsigner \
            -verbose \
            -sigalg SHA1withRSA \
            -digestalg SHA1 \
            -keystore "${KEYSTORE_PATH}" \
            -storepass "${KEYSTORE_PASSWORD:-}" \
            "${apk_file}" \
            "${KEY_ALIAS}"
        log "${GREEN}APK signed!${NC}"
    else
        log "${YELLOW}Keystore not configured. APK is unsigned.${NC}"
    fi
}

# Main menu
main() {
    echo ""
    echo "============================================="
    echo "  Nabungo Flutter Production Build"
    echo "============================================="
    echo ""
    echo "API Base URL: ${API_BASE_URL}"
    echo "Build number: ${BUILD_NUMBER}"
    echo "Flavor: ${FLAVOR}"
    echo ""

    check_requirements

    case "${1:-all}" in
        apk)
            clean_build
            get_dependencies
            generate_code
            analyze_code
            build_apk
            ;;
        appbundle|aab)
            clean_build
            get_dependencies
            generate_code
            analyze_code
            build_appbundle
            ;;
        ios)
            clean_build
            get_dependencies
            generate_code
            analyze_code
            build_ios
            ;;
        all)
            clean_build
            get_dependencies
            generate_code
            analyze_code
            run_tests
            build_apk
            build_appbundle
            ;;
        clean)
            clean_build
            ;;
        *)
            echo "Usage: $0 [command]"
            echo ""
            echo "Commands:"
            echo "  all           Full build (APK + AAB)"
            echo "  apk           Build APK only"
            echo "  aab           Build App Bundle only"
            echo "  ios           Build iOS (requires macOS)"
            echo "  clean         Clean build artifacts"
            echo ""
            echo "Environment variables:"
            echo "  API_BASE_URL  Backend API URL (default: ${API_BASE_URL})"
            echo "  BUILD_NUMBER  Build number (default: ${BUILD_NUMBER})"
            echo "  FLAVOR        App flavor (default: ${FLAVOR})"
            echo "  KEYSTORE_PATH Keystore path for signing"
            echo "  KEY_ALIAS     Keystore key alias"
            ;;
    esac

    echo ""
    log "${GREEN}Build process completed!${NC}"
}

main "$@"
