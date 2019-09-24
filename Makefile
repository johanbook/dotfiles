@PHONY: install
install:
    ln -s $(pwd)/.vimrc ~/.vimrc
    ln -s $(pwd)/.zshrc ~/zshrc
    echo  "Start vim and run :PluginInstall"

