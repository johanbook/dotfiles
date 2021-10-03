# Johan's Dotfiles

I am running Arch Linux on Wayland and Sway. On top of that I use a Gruvbox
inspired theme. See the screenshot below for look and feel. Feel free to check
out my configs!

![screenshot](https://raw.githubusercontent.com/johanbook/dotfiles/master/screenshot.jpg)

There is install script in `install.sh`.

## Sway

Sway can be tied to the login shell by adding

```sh
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
```

to e.g. `/etc/profile`.

## Terminal

### Fonts

I am normally content with Font Awesome, but one can install nerdfonts using

```sh
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts .nerd-fonts/
bash .nerd-fonts/.install.sh
```

## Jupyter Notebook

If using Jupyter Notebook one can use custom themes. Install `jupyter-theme` to
your system wide Python distribution,

```sh
sudo pip3 install jupyter-theme
```

Change theme to gruvbox

```sh
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
