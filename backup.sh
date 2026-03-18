#!/usr/bin/env bash
# =====================================================================
# Ansha Shine Kids School — Automated Backup Script
# Backs up Docker container volumes and exports a timestamped archive
# =====================================================================
# USAGE:
#   ./backup.sh                      # Run manually
#   ./backup.sh --quiet               # Silent mode (for cron)
#
# CRON SETUP (Daily backup at 6 PM, weekly on Friday 8 PM):
#   Run:  crontab -e
#   Add:
#     0 18 * * *    /path/to/backup.sh --quiet >> /var/log/ansha-backup.log 2>&1
#     0 20 * * 5    /path/to/backup.sh --quiet >> /var/log/ansha-backup.log 2>&1
# =====================================================================

set -euo pipefail

# ─── Config ──────────────────────────────────────────────────────────
BACKUP_DIR="${BACKUP_DIR:-./backups}"
RETAIN_DAYS="${RETAIN_DAYS:-30}"         # Keep backups for 30 days
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
QUIET=false

# Parse flags
for arg in "$@"; do
  case $arg in
    --quiet|-q) QUIET=true ;;
  esac
done

log() { $QUIET || echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }
log_always() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }

log_always "====== Ansha Shine Kids School — Backup Started ======"
log "Backup directory : $BACKUP_DIR"
log "Retention period : $RETAIN_DAYS days"

# ─── Create backup directories ───────────────────────────────────────
mkdir -p "$BACKUP_DIR/erp"
mkdir -p "$BACKUP_DIR/lms"
mkdir -p "$BACKUP_DIR/compose"

# ─── 1. Backup Docker Compose config ─────────────────────────────────
log "Backing up docker-compose.yml..."
cp docker-compose.yml "$BACKUP_DIR/compose/docker-compose-$DATE.yml"

# ─── 2. Backup ERP static files (from container or source) ───────────
log "Backing up ERP source files..."
if command -v docker &>/dev/null; then
  # Try to copy from running container
  if docker ps --format '{{.Names}}' | grep -q '^ansha-erp$'; then
    docker cp ansha-erp:/usr/share/nginx/html "$BACKUP_DIR/erp/erp-html-$DATE" 2>/dev/null || true
    log "  ✓ ERP files copied from container"
  fi
fi

# Always archive source directory
if [ -d "./erp" ]; then
  tar -czf "$BACKUP_DIR/erp/erp-source-$DATE.tar.gz" \
    --exclude='./erp/.git' \
    --exclude='./erp/node_modules' \
    ./erp/
  log "  ✓ ERP source archived: erp-source-$DATE.tar.gz"
fi

# ─── 3. Backup LMS static files ──────────────────────────────────────
log "Backing up LMS source files..."
if command -v docker &>/dev/null; then
  if docker ps --format '{{.Names}}' | grep -q '^ansha-lms$'; then
    docker cp ansha-lms:/usr/share/nginx/html "$BACKUP_DIR/lms/lms-html-$DATE" 2>/dev/null || true
    log "  ✓ LMS files copied from container"
  fi
fi

if [ -d "./lms" ]; then
  tar -czf "$BACKUP_DIR/lms/lms-source-$DATE.tar.gz" \
    --exclude='./lms/.git' \
    --exclude='./lms/node_modules' \
    ./lms/
  log "  ✓ LMS source archived: lms-source-$DATE.tar.gz"
fi

# ─── 4. Export Docker images (weekly only — check if Friday) ─────────
DAY_OF_WEEK=$(date +%u)  # 1=Mon ... 7=Sun
if [ "$DAY_OF_WEEK" -eq 5 ] || [ "${FORCE_IMAGE_EXPORT:-false}" = "true" ]; then
  log "Friday detected — exporting Docker images..."
  IMAGES_DIR="$BACKUP_DIR/images"
  mkdir -p "$IMAGES_DIR"

  if command -v docker &>/dev/null; then
    if docker image inspect ansha-erp:latest &>/dev/null 2>&1; then
      docker save ansha-erp:latest | gzip > "$IMAGES_DIR/ansha-erp-$DATE.tar.gz"
      log "  ✓ ERP image saved: ansha-erp-$DATE.tar.gz"
    fi
    if docker image inspect ansha-lms:latest &>/dev/null 2>&1; then
      docker save ansha-lms:latest | gzip > "$IMAGES_DIR/ansha-lms-$DATE.tar.gz"
      log "  ✓ LMS image saved: ansha-lms-$DATE.tar.gz"
    fi
  fi
fi

# ─── 5. Create combined full backup archive ───────────────────────────
log "Creating combined full backup archive..."
FULL_ARCHIVE="$BACKUP_DIR/ansha-full-backup-$DATE.tar.gz"
tar -czf "$FULL_ARCHIVE" \
  "$BACKUP_DIR/erp/erp-source-$DATE.tar.gz" \
  "$BACKUP_DIR/lms/lms-source-$DATE.tar.gz" \
  "$BACKUP_DIR/compose/docker-compose-$DATE.yml" \
  2>/dev/null || true

BACKUP_SIZE=$(du -sh "$FULL_ARCHIVE" 2>/dev/null | cut -f1 || echo "unknown")
log_always "  ✓ Full archive: $FULL_ARCHIVE ($BACKUP_SIZE)"

# ─── 6. Write backup manifest ────────────────────────────────────────
MANIFEST="$BACKUP_DIR/backup-manifest.log"
echo "$DATE | Full Backup | $BACKUP_SIZE | $(hostname)" >> "$MANIFEST"
log "  ✓ Manifest updated: $MANIFEST"

# ─── 7. Clean up old backups (older than RETAIN_DAYS) ────────────────
log "Cleaning up backups older than $RETAIN_DAYS days..."
find "$BACKUP_DIR" -name "*.tar.gz" -mtime +$RETAIN_DAYS -delete 2>/dev/null || true
find "$BACKUP_DIR" -name "*.yml"    -mtime +$RETAIN_DAYS -delete 2>/dev/null || true
log "  ✓ Old backups cleaned"

log_always "====== Backup Completed Successfully: $DATE ======"
log_always "  Archive : $FULL_ARCHIVE"
log_always "  Size    : $BACKUP_SIZE"
echo ""
