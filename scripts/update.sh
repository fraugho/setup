#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="$(dirname "$SCRIPT_DIR")"

cd "$SETUP_DIR"
git add .
git commit -m "$(date +"%d/%m/%Y %H:%M")"
git push
