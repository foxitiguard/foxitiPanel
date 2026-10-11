#!/usr/bin/env bash
# FOXITI Control Panel installer bootstrap
# Copyright (c) Foxitiguard Technologies Bangladesh.
#
# IMPORTANT:
# This bootstrap deliberately does not install upstream HestiaCP packages.
# Configure and publish FOXITI-built, signed packages before enabling installation.

set -Eeuo pipefail
IFS=$'\n\t'
umask 077

FOXITI_NAME="FOXITI Control Panel"
FOXITI_VERSION="${FOXITI_VERSION:-0.1.0-dev}"
FOXITI_ROOT="/usr/local/foxiti"
LOG_DIR="/var/log/foxiti-installer"
LOG_FILE="${LOG_DIR}/install-$(date +%Y%m%d-%H%M%S).log"

RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
RESET=$'\033[0m'

log() {
    printf '%s [INFO] %s\n' "$(date '+%F %T')" "$*" | tee -a "$LOG_FILE"
}
warn() {
    printf '%s [WARN] %s\n' "$(date '+%F %T')" "$*" | tee -a "$LOG_FILE" >&2
}
die() {
    printf '%s [ERROR] %s\n' "$(date '+%F %T')" "$*" | tee -a "$LOG_FILE" >&2
    exit 1
}

usage() {
    cat <<'EOF'
FOXITI Control Panel installer bootstrap

Usage:
  sudo bash foxiti-install-OS.sh --check
  sudo bash foxiti-install-OS.sh --help

Options:
  --check     Run preflight checks only; makes no system changes.
  --help      Show this help.

Installation is intentionally disabled in this development bootstrap until
FOXITI's own package repository, signing key, and tested package artifacts
are configured. Do not use this file as a production installer yet.
EOF
}

need_root() {
    [[ "${EUID}" -eq 0 ]] || die "Run as root (for example: sudo bash $0 --check)."
}

setup_logging() {
    mkdir -p "$LOG_DIR"
    chmod 700 "$LOG_DIR"
    touch "$LOG_FILE"
    chmod 600 "$LOG_FILE"
}

check_os() {
    [[ -r /etc/os-release ]] || die "/etc/os-release not found."
    # shellcheck disable=SC1091
    . /etc/os-release
    [[ "${ID:-}" == "ubuntu" ]] || die "Unsupported OS ID: ${ID:-unknown}. Expected ubuntu."
    case "${VERSION_ID:-}" in
        22.04|24.04|26.04) ;;
        *) die "Unsupported ${PRETTY_NAME:-OS} version. Supported versions for this draft: Ubuntu 22.04, 24.04, or 26.04." ;;
    esac
    log "Detected OS: ${PRETTY_NAME:-$ID $VERSION_ID}"
    log "Architecture: $(dpkg --print-architecture 2>/dev/null || uname -m)"
}

check_system() {
    need_root
    setup_logging
    check_os

    command -v apt-get >/dev/null 2>&1 || die "apt-get is required."
    command -v dpkg-query >/dev/null 2>&1 || die "dpkg-query is required."
    command -v systemctl >/dev/null 2>&1 || warn "systemctl not found; service checks may be unavailable."

    if [[ -d /usr/local/hestia || -d /usr/local/foxiti ]]; then
        warn "A panel directory already exists. This preflight will not modify it."
    fi

    local free_kb
    free_kb="$(df -Pk / | awk 'NR==2 {print $4}')"
    [[ "$free_kb" =~ ^[0-9]+$ ]] || die "Could not determine free disk space."
    if (( free_kb < 5 * 1024 * 1024 )); then
        warn "Less than 5 GiB free on root filesystem. Check storage before installation."
    else
        log "Root filesystem free space: $((free_kb / 1024 / 1024)) GiB"
    fi

    if ! getent hosts "$(hostname -f 2>/dev/null || hostname)" >/dev/null 2>&1; then
        warn "The server hostname does not resolve through the current resolver. Verify hostname and DNS."
    fi

    log "Preflight checks passed. No packages were installed and no services were changed."
}

main() {
    local action="${1:---help}"
    case "$action" in
        --help|-h) usage ;;
        --check)
            check_system
            printf '\n%sPreflight completed successfully.%s\n' "$GREEN" "$RESET"
            printf 'Log: %s\n' "$LOG_FILE"
            ;;
        --install)
            need_root
            setup_logging
            die "Installation is disabled: FOXITI package names, signed repository, and release artifacts have not yet been configured. This guard prevents accidentally installing upstream HestiaCP packages."
            ;;
        *)
            usage
            die "Unknown option: $action"
            ;;
    esac
}

main "$@"
