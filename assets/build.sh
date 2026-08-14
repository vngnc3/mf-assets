#!/usr/bin/env bash
# Generate the remote asset listing for a Blender asset library.
# Run on any machine with Blender 5.2+ (the lib dir does NOT need to be on the homelab).
#
# Usage:
#   ./build.sh [LIB_DIR] [BLENDER_BIN]
# Defaults: LIB_DIR=~/blender-assets-repo/lib, BLENDER_BIN=blender (or $BLENDER_BIN env)
#
# Re-run after ANY change to assets or catalogs (edits, removals, new assets).
set -euo pipefail

LIB_DIR="${1:-$HOME/songbird/blender-assets/mf-assets/assets}"
BLENDER_BIN="${2:-${BLENDER_BIN:-blender}}"

if [ ! -d "$LIB_DIR" ]; then
  echo "error: $LIB_DIR does not exist" >&2
  exit 1
fi

echo "==> generating listing for $LIB_DIR with $BLENDER_BIN"
"$BLENDER_BIN" -b -c asset_listing generate "$LIB_DIR"

echo "==> done. listing files:"
find "$LIB_DIR" -maxdepth 2 \( -name '_asset-library-meta.json' -o -name 'asset-index.json' -o -name 'assets-*.json' \) -newer "$LIB_DIR" 2>/dev/null | head

echo
echo "first run only: edit $LIB_DIR/_asset-library-meta.json (name + contact)."
echo "the generator preserves those edits on later runs."
