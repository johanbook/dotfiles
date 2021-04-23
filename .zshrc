# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# export LANG="en_US.UTF-8"

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
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Syntax highlighting
source ~/.dotfiles/bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load NVM to handle node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load private envs
source ~/.dotfiles/.env

# Unset capslock because it causes more trouble then it gives
setxkbmap -option '' -option 'ctrl:nocaps'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
