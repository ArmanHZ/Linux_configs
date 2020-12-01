#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
#   / /_ ___) |  _  |  _ <| |___ 
#  /____|____/|_| |_|_| \_\\____|
#

autoload -U colors && colors
# [[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

PS1=%{$(tput setaf 208)%}"┌──("%{$(tput setaf 223)%}%n%{$(tput setaf 124)%}%{$(tput bold)%}"@"%{$(tput sgr0)%}%{$(tput setaf 106)%}%m%{$(tput setaf 208)%}")-["%{$(tput setaf 214)%}%~%{$(tput setaf 208)%}"]""
└─"%{$(tput setaf 130)%}"$ "%{$reset_color%}

# Basic auto/tab complete:
zstyle ':completion:*' menu select
# zstyle ':completion:*' list-colors '=*=32'
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Case in-sensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
eval "$(dircolors)"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Load aliases
source $HOME/.config/Scripts/aliasesrc

autoload -Uz promptinit
promptinit

# ctrl + arrowkey movement
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Syntax highlighting plugin
source ~/.config/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

