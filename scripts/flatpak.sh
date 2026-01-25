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

# OBS needs device access
flatpak override --user --device=all com.obsproject.Studio

# Create symlinks for CLI access
declare -A symlinks=(
    ["com.valvesoftware.Steam"]="/usr/bin/steam"
    ["com.vivaldi.Vivaldi"]="/usr/local/bin/vivaldi"
    ["me.iepure.devtoolbox"]="/usr/local/bin/devtoolbox"
    ["io.github.nokse22.asciidraw"]="/usr/local/bin/asciidraw"
    ["com.github.iwalton3.jellyfin-media-player"]="/usr/local/bin/jellyfin"
    ["com.obsproject.Studio"]="/usr/local/bin/obs"
    ["org.mozilla.firefox"]="/usr/bin/firefox"
    ["io.gitlab.librewolf-community"]="/usr/bin/librewolf"
    ["org.onlyoffice.desktopeditors"]="/usr/bin/only-office"
    ["org.torproject.torbrowser-launcher"]="/usr/bin/tor-browser"
    ["net.mullvad.MullvadBrowser"]="/usr/bin/mullvad-browser"
    ["com.github.reds.LogisimEvolution"]="/usr/bin/logisim"
    ["com.github.tchx84.Flatseal"]="/usr/bin/flatseal"
    ["com.parsecgaming.parsec"]="/usr/bin/parsec"
)

for app in "${!symlinks[@]}"; do
    target="${symlinks[$app]}"
    sudo ln -sf "/var/lib/flatpak/exports/bin/$app" "$target"
done
