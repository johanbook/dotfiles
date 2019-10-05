# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vim style keys
bindkey -v


# Aliases
source  ~/.dotfiles/.alias

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
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

