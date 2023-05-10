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
# Autocompletion
################################
zstyle :compinstall filename '/home/book/.zshrc'

autoload -Uz compinit
compinit

# Needed for docker tab completion for options
# See https://github.com/ohmyzsh/ohmyzsh/issues/9266
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes


################################
# General
################################
# export LANG="en_US.UTF-8"

# Vim style keys
bindkey -v

# Aliases
source  ~/.dotfiles/.alias

# Fuzzy finder (FZF)
FZF_DEFAULT_COMMAND='ls'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Linux
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

# Mac
[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ] && source /opt/homebrew/opt/fzf/shell/completion.zsh
[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh


# Powerlevel10k
source ~/.dotfiles/.powerlevel9k
source ~/.dotfiles/bin/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

# Syntax highlighting
source ~/.dotfiles/bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load NVM to handle Nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load private envs
source ~/.dotfiles/.env

# Local configs
# Such as custom appitions to PATH (for i.e. gcloud)
[ -f ~/.dotfiles/.zshrc.local ] && source ~/.dotfiles/.zshrc.local
