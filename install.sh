# Arch Linux install script that installs Wayland, Sway etc

set -e


################################################
# Packages
################################################
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

echo "- Installing NVM (Nodejs Version Manager)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | sh

echo "- Installing Zsh syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/bin/zsh-syntax-highlighting

echo "- Installing Zsh theme Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.dotfiles/bin/zsh-theme-powerlevel10k


###############################################
# Configurations
################################################
echo "- Symlinking configuration files"
echo "This will clear your existing configuration files."
read -r -p "Are you sure you want to proceed? [y/N] " response
if [ "$response" != "y" ]
then
    echo "Installation was cancelled by user"
    exit 0
fi

mkdir -p ~/.config
ln -sf $(pwd)/alacritty/ ~/.config/alacritty
ln -sf $(pwd)/.Rprofile ~/.Rprofile
ln -sf $(pwd)/sway/ ~/.config/sway
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/vim/ ~/.vim
ln -sf $(pwd)/waybar/ ~/.config/waybar
ln -sf $(pwd)/.zshrc ~/.zshrc
touch $(pwd)/.env



################################################
# Cleanup
################################################
echo "Installation complete"
echo "Restart Sway and all terminals for effects to take place"
echo "To complete vim installation, open Vim and run :PluginInstall"
echo "To install Nodejs run `nvm install node && nvm use node`"
