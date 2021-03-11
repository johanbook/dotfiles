################################
# History
################################
HISTFILE=~/.histfile
HISTSIZE=10000 # max session size
SAVEHIST=50000 # max file size

# Append to history instead of rewriting it, useful when having multiple
# concurrent terminals
setopt APPEND_HISTORY 

# Record command timestamps 
setopt EXTENDED_HISTORY       

# Append into history file immediately instead on shell exit
# Useful when running concurrent terminals or unexpected exits
# setopt INC_APPEND_HISTORY 

# Ignore
setopt HIST_IGNORE_ALL_DUPS

# Ignore commands that start with space
setopt HIST_IGNORE_SPACE      

# Delete empty lines and spaces from history file
setopt HIST_REDUCE_BLANKS  

setopt SHARE_HISTORY


################################
# General
################################

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

# Load private envs
source ~/.dotfiles/.env

# Unset capslock because it causes more trouble then it gives
setxkbmap -option '' -option 'ctrl:nocaps'
