echo "This will clear your existing configuration files."
read -r -p "Are you sure you want to proceed? [y/N] " response
if [ "$response" != "y" ]
then
    echo "Installation was cancelled by user"
    exit 0
fi

# Configs
ln -sf $(pwd)/alacritty/ ~/.config/alacritty
ln -sf $(pwd)/.Rprofile ~/.Rprofile
ln -sf $(pwd)/sway/ ~/.config/sway
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/vim/ ~/.vim
ln -sf $(pwd)/waybar/ ~/.config/waybar
ln -sf $(pwd)/.zshrc ~/.zshrc

echo "Installation complete"
echo "Restart all terminals for effects to take place"

# Spotify client
sudo pacman -S ncspot
