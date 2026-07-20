#!/bin/bash
# Swap in the real Journey logo (and other pending photos), then reopen index.html.
#
# Usage:
#   ./update-logo.sh /path/to/journey-logo.png      # sets the slide-1 logo
#   ./update-logo.sh anukul /path/to/photo.jpg      # sets Anukul & Jagrati (slide 8)
#
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

put(){ cp "$2" "$DIR/assets/$1"; sips -Z 1600 "$DIR/assets/$1" >/dev/null 2>&1; echo "✅ Updated assets/$1"; }

if [ "$1" = "anukul" ]; then
  [ -f "$2" ] || { echo "File not found: $2"; exit 1; }
  put "induct_anukul.jpg" "$2"
elif [ -n "$1" ] && [ -f "$1" ]; then
  cp "$1" "$DIR/assets/journey-logo.png"
  echo "✅ Updated assets/journey-logo.png (slide-1 logo)"
else
  echo "Usage:"
  echo "  ./update-logo.sh /path/to/journey-logo.png     # slide-1 logo"
  echo "  ./update-logo.sh anukul /path/to/photo.jpg     # Anukul & Jagrati (slide 8)"
  exit 1
fi
echo "   Reopen index.html to see the change."
