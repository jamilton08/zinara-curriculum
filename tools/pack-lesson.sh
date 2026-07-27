#!/usr/bin/env bash
# Package a lesson folder into a .zlesson distribution zip (excludes caches and dev addon copies).
# Usage: tools/pack-lesson.sh modules/m1-basics/m1.l2-if-else dist/
set -e
LESSON="$1"; OUT="${2:-dist}"
[ -d "$LESSON" ] || { echo "usage: $0 <lesson-folder> [outdir]"; exit 1; }
mkdir -p "$OUT"
NAME=$(basename "$LESSON")
( cd "$(dirname "$LESSON")" && zip -rq "$OLDPWD/$OUT/$NAME.zlesson" "$NAME" -x "*/.godot/*" "*/addons/*" "*.import" )
echo "Packed $OUT/$NAME.zlesson"
