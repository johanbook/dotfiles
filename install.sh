echo "This will clear your existing configuration files."
read -r -p "Are you sure you want to proceed? [y/N] " response
if [ "$response" != "y" ]
then
    echo "Installation was cancelled by user"
    exit 0
fi

pwd=$(pwd)

# Vim
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/vim/ ~/.vim

ln -sf $(pwd)/.zshrc ~/.zshrc

echo "Installation complete"
echo "Restart all terminals for effects to take place"
