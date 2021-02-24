# History
HISTFILE=~/.histfile
HISTSIZE=10000 # max session size
SAVEHIST=50000 # max file size

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt INC_APPEND_HISTORY # append into history file
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS  ## Delete empty lines from history file
setopt HIST_NO_STORE  ## Do not add history and fc commands to the history

# Vim style keys
bindkey -v

# Aliases
source  ~/.dotfiles/.alias

# zsh-system-clipboard
source ~/.dotfiles/bin/zsh-system-clipboard/zsh-system-clipboard.zsh

# Fuzzy finder
FZF_DEFAULT_COMMAND='ls'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Powerlevel9k
source ~/.dotfiles/.powerlevel9k
source ~/.powerlevel9k/powerlevel9k.zsh-theme

# Colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# Syntax highlighting
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

# Load NVM to handle node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

xrdb ~/.Xresources

# Unset capslock
setxkbmap -option '' -option 'ctrl:nocaps'

source ~/.dotfiles/.env
