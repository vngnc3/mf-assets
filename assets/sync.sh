#!/usr/bin/env bash
# Sync a Blender remote asset library directory to an R2 bucket.
# Run from the homelab (or anywhere with rclone configured).
#
# Usage:
#   ./sync.sh [LIB_DIR] [RCLONE_REMOTE]
# Defaults: LIB_DIR=~/blender-assets-repo/lib, RCLONE_REMOTE=r2:blender-assets
#
# rclone remote must be configured first — see README.md for the config block.
set -euo pipefail

LIB_DIR="${1:-$HOME/songbird/blender-assets/mf-assets/assets}"
REMOTE="${2:-${RCLONE_REMOTE:-r2:mf-assets}}"

if ! rclone listremotes | grep -q "^$(echo "$REMOTE" | cut -d: -f1):$"; then
  echo "error: rclone remote '$REMOTE' not configured" >&2
  exit 1
fi

echo "==> syncing $LIB_DIR -> $REMOTE"
rclone sync "$LIB_DIR" "$REMOTE" \
  --checksum \
  --progress \
  --exclude '.DS_Store/**' \
  --exclude '*.tmp' \
  --exclude '*.blend1' \
  --exclude '*.blend2'

echo "==> synced. verify with:"
echo "    ./verify.sh https://blender.mata.bot"
