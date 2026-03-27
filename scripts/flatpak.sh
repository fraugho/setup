#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLATPAKS_FILE="$SCRIPT_DIR/../data/flatpaks.txt"

# Flathub Setup
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install all flatpaks from list
while IFS= read -r app || [[ -n "$app" ]]; do
    [[ -z "$app" || "$app" =~ ^# ]] && continue
    echo "Installing $app..."
    flatpak install -y flathub "$app"
done < "$FLATPAKS_FILE"

# Symlink map: flatpak app ID -> CLI path
declare -A symlinks=(
    ["org.onlyoffice.desktopeditors"]="/usr/bin/only-office"
    ["org.torproject.torbrowser-launcher"]="/usr/bin/tor-browser"
    ["com.parsecgaming.parsec"]="/usr/bin/parsec"
)

# Only create symlinks for apps that are actually installed
for app in "${!symlinks[@]}"; do
    if flatpak info "$app" > /dev/null 2>&1; then
        target="${symlinks[$app]}"
        sudo ln -sf "/var/lib/flatpak/exports/bin/$app" "$target"
        echo "  Symlinked $app -> $target"
    fi
done
