#!/bin/bash

git clone https://github.com:fraugho/zsh-config.git ~/zsh-config
cp ~/zsh-config/.zshrc ~/
rm -rf ~/zsh-config

#tmux
#git clone git@github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#alacritty
git clone git@github.com:fraugho/alacritty.git .config/alacritty

#neovim
git clone git@github.com:fraugho/nvim.git .config/nvim

#picom
git clone git@github.com:fraugho/picom.git .config/picom

#hyprland
git clone git@github.com:fraugho/hypr.git .config/hypr

#Wallpapers
git clone git@github.com:fraugho/wallpapers.git .config/wallpapers
