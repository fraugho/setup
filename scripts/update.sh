#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="$(dirname "$SCRIPT_DIR")"

rm -f "$SETUP_DIR/data/packages.txt"

dnf list installed | awk 'NR > 1 {sub(/\.x86_64$/,"", $1); sub(/\.i686$/, "", $1); sub(/\.noarch$/, "", $1); print $1}' > "$SETUP_DIR/data/packages.txt"

cd "$SETUP_DIR"
git add .
git commit -m "$(date +"%d/%m/%Y %H:%M")"
git push
