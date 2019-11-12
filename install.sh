echo "This will clear your existing configuration files."
read -r -p "Are you sure you want to proceed? [y/N] " response
if [ "$response" != "y" ]
then
    echo "Installation was cancelled by user"
    exit 0
fi

pwd=$(pwd)

# ctags
apt-get install ctags
ln -sf $(pwd)/.ctags ~/.ctags
git config --global init.templatedir $(pwd)'/git_template'

# i3
ln -sf $(pwd)/i3/config ~/.i3/config
ln -sf $(pwd)/i3/.i3blocks.conf ~/.i3blocks.conf
ln -sf $(pwd)/i3/i3blocks/ ~/.config/i3/i3blocks

# Vim
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/vim/ ~/.vim

# zsh
ln -sf $(pwd)/.zshrc ~/.zshrc

echo "Installation complete"
echo "Restart all terminals for effects to take place"
