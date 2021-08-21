# Johan's Dotfiles

I am running Arch Linux with a Gruvbox inspired theme. See the screenshot below
for look and feel. Feel free to check out my configs!

![screenshot](https://raw.githubusercontent.com/johanbook/dotfiles/master/screenshot.jpg)

## Sway

I use `Sway` as window manager. On Arch it can be installed as

```sh
sudo pacman -S sway
```

and can be tied to the login shell using

```sh
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
```

## Terminal

As a terminal emulator, I use `alacritty` which ships with `zsh` by default (the
one and superior shell).

```bash
sudo pacman -S alacritty
```

### Fonts

We need the install the nerdfonts.

```bash
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts .nerd-fonts/
bash .nerd-fonts/.install.sh
```

### Powerline

Install powerline and copy settings.

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
