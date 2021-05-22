#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
#   / /_ ___) |  _  |  _ <| |___ 
#  /____|____/|_| |_|_| \_\\____|
#

autoload -U colors && colors
# [[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

# PS1=%{$(tput setaf 208)%}"┌──("%{$(tput setaf 223)%}%n%{$(tput setaf 124)%}%{$(tput bold)%}"@"%{$(tput sgr0)%}%{$(tput setaf 106)%}%m%{$(tput setaf 208)%}")-["%{$(tput setaf 214)%}%~%{$(tput setaf 208)%}"]""
# └─"%{$(tput setaf 130)%}"$ "%{$reset_color%}

NEWLINE=$'\n'
PS1="${NEWLINE}"%F{183}%~%F{212}" ${NEWLINE}λ ➤ "%f
# preexec () { echo -ne "\e[0m" }

# Basic auto/tab complete:
zstyle ':completion:*' menu select
# zstyle ':completion:*' list-colors '=*=32'
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Case in-sensitive matching
source $HOME/.config/Scripts/set_ls_colors.sh
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Load aliases
source $HOME/.config/Scripts/aliasesrc

autoload -Uz promptinit
promptinit

# ctrl + arrowkey movement
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Syntax highlighting plugin
# source ~/.config/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"

