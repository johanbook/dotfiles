#!/bin/bash
# Arch Linux install script that installs Wayland, Sway etc

set -e

DOTFILES_DIR=$(pwd)

################################################
# Packages
################################################
sh ./scripts/install.arch.sh

echo "- Installing NVM (Nodejs Version Manager)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | sh

echo "- Installing Zsh syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $DOTFILES_DIR/bin/zsh-syntax-highlighting

echo "- Installing Zsh theme Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $DOTFILES_DIR/bin/zsh-theme-powerlevel10k

###############################################
# Configurations
################################################
echo "- Symlinking configuration files"
echo "This will clear your existing configuration files."
read -r -p "Are you sure you want to proceed? [y/N] " response
if [ "$response" != "y" ]; then
	echo "Installation was cancelled by user"
	exit 0
fi

mkdir -p ~/.config
ln -sf $DOTFILES_DIR/alacritty/ ~/.config/alacritty
ln -sf $DOTFILES_DIR/.Rprofile ~/.Rprofile
ln -sf $DOTFILES_DIR/sway/ ~/.config/sway
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/vim/ ~/.vim
ln -sf $DOTFILES_DIR/waybar/ ~/.config/waybar
ln -sf $DOTFILES_DIR/tmux.conf ~/.tmux.conf
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
touch $DOTFILES_DIR/.env

################################################
# Cleanup
################################################
echo "Installation complete"
echo "Restart Sway and all terminals for effects to take place"
echo "To complete vim installation, open Vim and run :PluginInstall"
echo "To install Nodejs run $(nvm install node && nvm use node)"
