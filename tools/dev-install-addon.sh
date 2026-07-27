#!/usr/bin/env bash
# Copy the canonical Classroom addon into a lesson project for local dev/testing.
# Usage: tools/dev-install-addon.sh modules/m1-basics/m1.l2-if-else
set -e
LESSON="$1"
[ -d "$LESSON" ] || { echo "usage: $0 <lesson-folder>"; exit 1; }
mkdir -p "$LESSON/addons"
cp -r "$(dirname "$0")/../addon/zinara_classroom" "$LESSON/addons/"
echo "Addon installed into $LESSON/addons/ (gitignored). Open the lesson in Godot and click Classroom."
