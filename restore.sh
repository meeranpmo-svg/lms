#!/usr/bin/env bash
# =====================================================================
# Ansha Shine Kids School — Restore Script
# Restores ERP + LMS from a backup archive
# =====================================================================
# USAGE:
#   ./restore.sh                                    # Interactive mode
#   ./restore.sh ./backups/ansha-full-backup-*.tar.gz
# =====================================================================

set -euo pipefail

log()       { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }
log_warn()  { echo "[$(date '+%Y-%m-%d %H:%M:%S')] ⚠️  WARNING: $*"; }
log_error() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] ❌ ERROR: $*" >&2; }

log "====== Ansha Shine Kids School — Restore Tool ======"

# ─── Check if Docker is available ────────────────────────────────────
if ! command -v docker &>/dev/null; then
  log_warn "Docker not found. Will restore source files only."
fi

# ─── Find or select backup file ──────────────────────────────────────
BACKUP_FILE="${1:-}"
if [ -z "$BACKUP_FILE" ]; then
  BACKUP_DIR="${BACKUP_DIR:-./backups}"
  log "Available backups in $BACKUP_DIR:"
  echo ""
  ls -lht "$BACKUP_DIR"/*.tar.gz 2>/dev/null | head -20 || echo "  No backup files found in $BACKUP_DIR"
  echo ""
  read -rp "Enter path to backup file: " BACKUP_FILE
fi

if [ ! -f "$BACKUP_FILE" ]; then
  log_error "Backup file not found: $BACKUP_FILE"
  exit 1
fi

log "Selected backup: $BACKUP_FILE"
BACKUP_SIZE=$(du -sh "$BACKUP_FILE" | cut -f1)
log "Backup size    : $BACKUP_SIZE"

# ─── Confirm ─────────────────────────────────────────────────────────
echo ""
echo "  ⚠️  WARNING: This will OVERWRITE the current ERP & LMS files!"
echo "  Containers will be stopped during restore."
echo ""
read -rp "  Type YES to confirm restore: " CONFIRM
if [ "$CONFIRM" != "YES" ]; then
  log "Restore cancelled by user."
  exit 0
fi

# ─── Create restore workspace ────────────────────────────────────────
RESTORE_TMP="./restore_tmp_$(date +%s)"
mkdir -p "$RESTORE_TMP"
log "Extracting backup to temporary directory..."
tar -xzf "$BACKUP_FILE" -C "$RESTORE_TMP" 2>/dev/null || true

# ─── Stop running containers ─────────────────────────────────────────
if command -v docker &>/dev/null && command -v docker compose &>/dev/null 2>&1; then
  log "Stopping containers..."
  docker compose down 2>/dev/null || true
fi

# ─── Restore ERP source ──────────────────────────────────────────────
ERP_ARCHIVE=$(find "$RESTORE_TMP" -name "erp-source-*.tar.gz" 2>/dev/null | head -1 || true)
if [ -n "$ERP_ARCHIVE" ]; then
  log "Restoring ERP source files..."
  # Backup current erp directory
  [ -d "./erp" ] && mv ./erp "./erp_backup_$(date +%s)"
  tar -xzf "$ERP_ARCHIVE" 2>/dev/null
  log "  ✓ ERP source restored"
else
  log_warn "ERP source archive not found in backup"
fi

# ─── Restore LMS source ──────────────────────────────────────────────
LMS_ARCHIVE=$(find "$RESTORE_TMP" -name "lms-source-*.tar.gz" 2>/dev/null | head -1 || true)
if [ -n "$LMS_ARCHIVE" ]; then
  log "Restoring LMS source files..."
  [ -d "./lms" ] && mv ./lms "./lms_backup_$(date +%s)"
  tar -xzf "$LMS_ARCHIVE" 2>/dev/null
  log "  ✓ LMS source restored"
else
  log_warn "LMS source archive not found in backup"
fi

# ─── Restore docker-compose.yml ──────────────────────────────────────
COMPOSE_BACKUP=$(find "$RESTORE_TMP" -name "docker-compose-*.yml" 2>/dev/null | head -1 || true)
if [ -n "$COMPOSE_BACKUP" ]; then
  cp "$COMPOSE_BACKUP" ./docker-compose.yml
  log "  ✓ docker-compose.yml restored"
fi

# ─── Rebuild & restart containers ────────────────────────────────────
if command -v docker &>/dev/null; then
  log "Rebuilding Docker images..."
  docker compose build --no-cache
  log "Starting containers..."
  docker compose up -d
  log "  ✓ Containers restarted"
fi

# ─── Cleanup ─────────────────────────────────────────────────────────
rm -rf "$RESTORE_TMP"
log "  ✓ Temporary files cleaned up"

log "====== Restore Completed Successfully ======"
log "  ERP : http://localhost:8081"
log "  LMS : http://localhost:3000"
echo ""
