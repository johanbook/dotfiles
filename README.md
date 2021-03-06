# Johan's Dotfiles

Using Ubuntu 18.04.3 LTS (Bionic) with the Gruvbox Theme. Here be a preview
![screenshot](https://raw.githubusercontent.com/johanbook/dotfiles/master/screenshot.png)

There is a semi-finished install script in `install.sh`.

## Terminal

First of all, we must install zsh, the one and superior shell.

```bash
sudo apt-get install zsh
```

Copy the `.zshrc` to your home folder, logout and login and you should be good
to go. Install https://github.com/kutsan/zsh-system-clipboard

### Fonts

We need the install the nerdfonts.

```bash
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts .nerd-fonts/
bash .nerd-fonts/.install.sh
```

### Appearance

Enter your terminal's preferences and choose a custom font. We should select a
Nerd font here. I went with `DroidSansMono Nerd Font Book` at 12px.

- Turn off the terminal bell (that's fudging annoying).
- Turn off `Show menubar by default`.
- Head over to and set custom colors and put in the Gruvbox theme as the
  background, foreground and palette.

## Powerline

Install powerline and copy settings.

## i3

Install i3 window manager

```bash
sudo apt-get install i3
```

Copy the `i3` configuration files. To activate it you must logout and choose
`i3` next to the login button.

## Vim

Make sure you have the best vim

```bash
sudo apt-get install vim?gtk?
```

Install Vundle using git clone. Once installed, run `:PluginInstall` inside Vim.
After that, you should be good to go.

## Jupyter Notebook

Install jupyter-theme to your system wide Python distribution,

```bash
sudo pip3 install jupyter-theme
```

and change theme to gruvbox

```bash
jupyter-theme -t gruvboxd
```

## Browser

I use the Brave browser with the following plugins;

- [Vimium](https://github.com/philc/vimium)
- [Gruvbox theme](https://github.com/bbrks/chrome-gruvbox)
- [Gruvbox dev tools](https://chrome.google.com/webstore/detail/devtools-theme-gruvbox-da/njcgdakjdifgccdgnoiphpnihcfopcmj)
