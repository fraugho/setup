#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

STEP=0
CHECK_MODE=false
ME_MODE=false

step() {
    STEP=$((STEP + 1))
    echo -e "\n${BLUE}[$STEP]${NC} $1"
}

ok()   { echo -e "  ${GREEN}OK${NC} $1"; }
warn() { echo -e "  ${YELLOW}WARN${NC} $1"; }
fail() { echo -e "  ${RED}FAIL${NC} $1"; }

trap 'echo -e "\n${RED}Setup failed at step $STEP.${NC} Check the output above for details." >&2' ERR

# Parse arguments
for arg in "$@"; do
    case "$arg" in
        --check) CHECK_MODE=true ;;
        --me|-me) ME_MODE=true ;;
        *) echo "Usage: bash setup.sh [--check] [--me]"; exit 1 ;;
    esac
done

# --- Validation / Check Mode ---

if $CHECK_MODE; then
    set +e  # Don't exit on errors during validation
    trap - ERR
    echo -e "${BLUE}=== Fedora Setup — Validation Mode ===${NC}\n"
    ERRORS=0

    step "Checking OS"
    if [ -f /etc/fedora-release ]; then
        ok "$(cat /etc/fedora-release)"
    else
        fail "Not running Fedora"; ERRORS=$((ERRORS + 1))
    fi

    step "Checking internet connectivity"
    if curl -s --max-time 5 https://fedoraproject.org > /dev/null 2>&1; then
        ok "Internet reachable"
    else
        fail "No internet connection"; ERRORS=$((ERRORS + 1))
    fi

    step "Checking required tools"
    for cmd in git curl dnf flatpak; do
        if command -v "$cmd" > /dev/null 2>&1; then
            ok "$cmd found"
        else
            fail "$cmd not found"; ERRORS=$((ERRORS + 1))
        fi
    done

    step "Validating DNF packages ($(wc -l < "$SCRIPT_DIR/data/packages.txt") packages)"
    while IFS= read -r pkg || [[ -n "$pkg" ]]; do
        [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
        if dnf info "$pkg" > /dev/null 2>&1; then
            ok "$pkg"
        else
            fail "$pkg — not found in repos"; ERRORS=$((ERRORS + 1))
        fi
    done < "$SCRIPT_DIR/data/packages.txt"

    step "Validating Flatpak app IDs"
    while IFS= read -r app || [[ -n "$app" ]]; do
        [[ -z "$app" || "$app" =~ ^# ]] && continue
        if [[ "$app" =~ ^[a-zA-Z][a-zA-Z0-9_-]*(\.[a-zA-Z][a-zA-Z0-9_-]*){2,}$ ]]; then
            ok "$app"
        else
            fail "$app — invalid Flatpak ID format"; ERRORS=$((ERRORS + 1))
        fi
    done < "$SCRIPT_DIR/data/flatpaks.txt"

    step "Checking git repos are reachable"
    for repo in alacritty nvim picom hypr; do
        url="https://github.com/fraugho/${repo}.git"
        if git ls-remote "$url" > /dev/null 2>&1; then
            ok "$url"
        else
            fail "$url — not reachable"; ERRORS=$((ERRORS + 1))
        fi
    done

    step "Checking config directories"
    for dir in alacritty nvim picom hypr; do
        target="$HOME/.config/$dir"
        if [ -d "$target" ]; then
            warn "$target already exists (will pull instead of clone)"
        else
            ok "$target — will be created"
        fi
    done

    echo ""
    if [ "$ERRORS" -eq 0 ]; then
        echo -e "${GREEN}=== All checks passed! Safe to run: bash setup.sh ===${NC}"
    else
        echo -e "${RED}=== $ERRORS error(s) found. Fix them before running setup. ===${NC}"
        exit 1
    fi
    exit 0
fi

# --- GitHub Login Mode ---

if $ME_MODE; then
    echo -e "${BLUE}=== GitHub Login ===${NC}"

    if ! command -v gh > /dev/null 2>&1; then
        echo -e "${YELLOW}Installing gh (GitHub CLI)...${NC}"
        sudo dnf install -y gh
    fi

    step "Logging into GitHub"
    gh auth login

    step "Configuring git credential helper"
    gh auth setup-git
    ok "HTTPS push/pull will now use your GitHub credentials"

    step "Setting git identity"
    read -rp "  Git name (e.g. fraugho): " git_name
    read -rp "  Git email: " git_email
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    ok "Set user.name=$git_name, user.email=$git_email"

    step "Restoring LibreWolf profile"
    PROFILE_ZIP="$SCRIPT_DIR/data/librewolf-profile.zip"
    if [ -f "$PROFILE_ZIP" ]; then
        PROFILE_DIR=$(find ~/.librewolf -maxdepth 1 -name "*.default-default*" -type d | head -1)
        if [ -z "$PROFILE_DIR" ]; then
            echo -e "  ${YELLOW}No LibreWolf profile directory found. Launch LibreWolf once first, then re-run.${NC}"
        else
            echo "  Enter password for LibreWolf profile:"
            unzip -o "$PROFILE_ZIP" -d /tmp/librewolf-restore
            cp -a /tmp/librewolf-restore/*/* "$PROFILE_DIR/"
            rm -rf /tmp/librewolf-restore
            ok "Restored LibreWolf profile to $PROFILE_DIR"
        fi
    else
        warn "No librewolf-profile.zip found, skipping"
    fi

    echo -e "\n${GREEN}=== GitHub login complete! ===${NC}"
    echo "You can now clone, commit, and push over HTTPS."
    exit 0
fi

# --- Actual Setup ---

echo -e "${BLUE}=== Fedora Setup ===${NC}"

step "Installing config files"
cp "$SCRIPT_DIR/config/antigen.zsh" ~/antigen.zsh
cp "$SCRIPT_DIR/config/.zshrc" ~/
ok "Copied antigen.zsh and .zshrc"

step "Installing bin scripts"
sudo cp "$SCRIPT_DIR/bin/libre" /usr/bin/libre
sudo cp "$SCRIPT_DIR/bin/my" /usr/bin/my
sudo chmod +x /usr/bin/libre /usr/bin/my
ok "Installed libre and my to /usr/bin/"

step "Making setup scripts executable"
chmod +x "$SCRIPT_DIR/scripts/"*.sh
ok "Done"

step "Installing DNF packages"
"$SCRIPT_DIR/scripts/dnf.sh"

step "Installing Flatpak apps"
"$SCRIPT_DIR/scripts/flatpak.sh"

step "Installing TUI tools (cargo/go/pip)"
"$SCRIPT_DIR/scripts/tui.sh"

step "Installing LM Studio"
mkdir -p ~/.local/bin
curl -L -o ~/.local/bin/LMStudio.AppImage https://lmstudio.ai/releases/latest/linux/x86_64/LMStudio.AppImage
chmod +x ~/.local/bin/LMStudio.AppImage
ln -sf ~/.local/bin/LMStudio.AppImage ~/.local/bin/lmstudio
ok "Installed to ~/.local/bin/lmstudio"

step "Installing Claude Code and OpenCode (via npm)"
npm install -g @anthropic-ai/claude-code opencode-ai
ok "Claude Code and OpenCode installed"

step "Cloning dotfiles repos"
"$SCRIPT_DIR/scripts/git.sh"

step "Installing wallpapers"
mkdir -p ~/.config/wallpapers
cp "$SCRIPT_DIR/wallpapers/"* ~/.config/wallpapers/
ok "Copied to ~/.config/wallpapers/"

step "Configuring mako (notifications)"
mkdir -p ~/.config/mako
cp "$SCRIPT_DIR/config/mako/config" ~/.config/mako/
ok "Copied mako config"

step "Configuring swaylock"
mkdir -p ~/.config/swaylock
cp "$SCRIPT_DIR/config/swaylock/config" ~/.config/swaylock/
ok "Copied swaylock config"

step "Configuring greetd (login manager)"
sudo cp "$SCRIPT_DIR/config/greetd/config.toml" /etc/greetd/config.toml
for dm in sddm gdm lightdm; do
    if systemctl is-enabled "$dm" > /dev/null 2>&1; then
        sudo systemctl disable --now "$dm"
        ok "Disabled $dm"
    fi
done
sudo systemctl enable greetd
ok "Installed config and enabled greetd service"

step "Setting default applications"
"$SCRIPT_DIR/scripts/default.sh"

echo -e "\n${GREEN}=== Setup Complete! ===${NC}"
echo "Restart your terminal or run: source ~/.zshrc"
