#!/bin/bash

# Flathub Setup
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Steam Flatpak
echo "Installing Steam Flatpak..."
flatpak install -y flathub com.valvesoftware.Steam
sudo ln -sf /var/lib/flatpak/exports/bin/com.valvesoftware.Steam /usr/bin/steam

# Proton-GE Flatpak
echo "Installing Proton-GE Flatpak"
flatpak install -y com.valvesoftware.Steam.CompatibilityTool.Proton-GE

# Vivaldi Flatpak
echo "Installing Vivaldi Flatpak"
flatpak install -y flathub com.vivaldi.Vivaldi
sudo ln -sf /var/lib/flatpak/exports/bin/com.vivaldi.Vivaldi /usr/local/bin/vivaldi

# DevTools flatpak
echo "Installing DevToolBox Flatpak"
flatpak install -y me.iepure.devtoolbox
sudo ln -sf /var/lib/flatpak/exports/bin/me.iepure.devtoolbox /usr/local/bin/devtoolbox

# AsciiDraw Flatpak
echo "Installing AsciiDraw Flatpak"
flatpak install -y io.github.nokse22.asciidraw
sudo ln -sf /var/lib/flatpak/exports/bin/io.github.nokse22.asciidraw /usr/local/bin/asciidraw

# Jellyfin Flatpak
echo "Installing Jellyfin Flatpak"
flatpak install -y flathub com.github.iwalton3.jellyfin-media-player
sudo ln -sf /var/lib/flatpak/exports/bin/com.github.iwalton3.jellyfin-media-player /usr/local/bin/jellyfin

# OBS Flatpak
echo "Installing OBS Flatpak"
flatpak install -y flathub com.obsproject.Studio
sudo flatpak override --device=all com.obsproject.Studio
sudo ln -sf /var/lib/flatpak/exports/bin/com.obsproject.Studio /usr/local/bin/obs

# Firefox Flatpak
echo "Installing Firefox Flatpak..."
flatpak install -y flathub org.mozilla.firefox
sudo ln -sf /var/lib/flatpak/exports/bin/org.mozilla.firefox /usr/bin/firefox

# Librewolf Flatpak
echo "Installing Librewolf Flatpak..."
flatpak install -y flathub io.gitlab.librewolf-community
sudo ln -sf /var/lib/flatpak/exports/bin/io.gitlab.librewolf-community /usr/bin/librewolf

# OnlyOffice Flatpak
echo "Installing OnlyOffice Flatpak"
flatpak install -y flathub org.onlyoffice.desktopeditors
sudo ln -sf /var/lib/flatpak/exports/bin/org.onlyoffice.desktopeditors /usr/bin/only-office

# Tor Browser Flatpak
echo "Installing Tor Browser Flatpak..."
flatpak install -y flathub org.torproject.torbrowser-launcher
sudo ln -sf /var/lib/flatpak/exports/bin/org.torproject.torbrowser-launcher /usr/bin/tor-browser

# Mullvad Browser Flatpak
echo "Installing Mullvad Browser Flatpak..."
flatpak install -y flathub net.mullvad.MullvadBrowser
sudo ln -sf /var/lib/flatpak/exports/bin/net.mullvad.MullvadBrowser /usr/bin/mullvad-browser

# Logisim Flatpak
echo "Installing Logisim Flatpak..."
flatpak install -y flathub com.github.reds.LogisimEvolution
sudo ln -sf /var/lib/flatpak/exports/bin/com.github.reds.LogisimEvolution /usr/bin/logisim

# Flatseal Flatpak
echo "Installing Flatseal..."
flatpak install -y flathub com.github.tchx84.Flatseal
sudo ln -sf /var/lib/flatpak/exports/bin/com.github.tchx84.Flatseal /usr/bin/flatseal

# Parsec Flatpak
echo "Installing Parsec..."
flatpak install -y flathub com.parsecgaming.parsec
sudo ln -sf /var/lib/flatpak/exports/bin/com.parsecgaming.parsec /usr/bin/parsec
