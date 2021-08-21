# Johan's Dotfiles

Using Arch Linux, inspired by the Gruvbox Theme. Here is a preview
![screenshot](https://raw.githubusercontent.com/johanbook/dotfiles/master/screenshot.png)

There is a WiP install script in `install.sh`.

## Terminal

First of all, we must install zsh, the one and superior shell.

```bash
sudo pacman -S alacritty
```

Copy the `.zshrc` to your home folder, logout and login and you should be good
to go.

### Fonts

We need the install the nerdfonts.

```bash
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts .nerd-fonts/
bash .nerd-fonts/.install.sh
```

## Powerline

Install powerline and copy settings.

## Sway

Install sway window manager

```sh
sudo pacman -S sway
```

Add following to shell init file.

```sh
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
```

Symlink the `sway` configuration files. 

## Vim

Make sure you have the best vim

```bash
pacman -S vim
```

Install Vundle using git clone. Once installed, run `:PluginInstall` inside Vim.
After that, you should be good to go.

## Jupyter Notebook

Install jupyter-theme to your system wide Python distribution,

```bash
sudo pip3 install jupyter-theme
```

Change theme to gruvbox

```bash
jupyter-theme -t gruvboxd
```

## Browser

I use the Brave browser with the following plugins;

- [Vimium](https://github.com/philc/vimium)
- [Gruvbox theme](https://github.com/bbrks/chrome-gruvbox)
- [Gruvbox dev tools](https://chrome.google.com/webstore/detail/devtools-theme-gruvbox-da/njcgdakjdifgccdgnoiphpnihcfopcmj)

## Various tricks

### Vim: sh: pipenv not found

If vim python integration fails due to pipenv is not found, run
`:let r = system(pip install pipenv)`.
