#!/bin/bash

clone_or_pull() {
    local repo="$1"
    local target="$2"

    if [ -d "$target/.git" ]; then
        echo "  Pulling latest for $target..."
        git -C "$target" pull
    else
        echo "  Cloning $repo -> $target..."
        git clone "https://github.com/fraugho/${repo}.git" "$target"
    fi
}

clone_or_pull alacritty ~/.config/alacritty
clone_or_pull nvim      ~/.config/nvim
clone_or_pull picom     ~/.config/picom
clone_or_pull hypr      ~/.config/hypr
