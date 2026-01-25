#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Fedora Setup ==="

# Download and install antigen
echo "Downloading antigen..."
curl -sL https://git.io/antigen -o ~/antigen.zsh

# Install config files
echo "Installing config files..."
cp "$SCRIPT_DIR/config/.zshrc" ~/

# Install bin scripts
echo "Installing bin scripts..."
sudo cp "$SCRIPT_DIR/bin/libre" /usr/bin/libre
sudo cp "$SCRIPT_DIR/bin/my" /usr/bin/my
sudo chmod +x /usr/bin/libre /usr/bin/my

# Make setup scripts executable
chmod +x "$SCRIPT_DIR/scripts/"*.sh

# Run setup scripts
echo "Running dnf setup..."
"$SCRIPT_DIR/scripts/dnf.sh"

echo "Running flatpak setup..."
"$SCRIPT_DIR/scripts/flatpak.sh"

echo "Running git config cloning..."
"$SCRIPT_DIR/scripts/git.sh"

echo "Setting default applications..."
"$SCRIPT_DIR/scripts/default.sh"

# Generate package snapshot
echo "Generating package snapshot..."
dnf list installed | awk 'NR > 1 {sub(/\.x86_64$/,"", $1); sub(/\.i686$/, "", $1); sub(/\.noarch$/, "", $1); print $1}' > "$SCRIPT_DIR/data/packages.txt"

echo "=== Setup Complete! ==="
echo "Restart your terminal or run: source ~/.zshrc"
