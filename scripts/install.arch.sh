#!/bin/bash
# This script will install Wayland, Sway and some other useful
# Arch utilities

set -e

echo "- Installing Pacman packages. This will need sudo privileges"
sudo pacman -S \
	alacritty \
	alsa-utils \
	fzf \
	git \
	grim \
	gvim \
	make \
	openssh \
	ripgrep \
	slurp \
	sway \
	swaylock \
	ttf-font-awesome \
	wayland \
	waybar \
	wofi \
	zsh
