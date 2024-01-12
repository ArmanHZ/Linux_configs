#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
#   / /_ ___) |  _  |  _ <| |___ 
#  /____|____/|_| |_|_| \_\\____|
#

autoload -U colors && colors

NEWLINE=$'\n'
PS1="${NEWLINE}"%F{#957FB8}%~%F{#D27E99}" ${NEWLINE}λ ➤  "%f

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

# Enable vi mode
# bindkey -v

# Colors for man and less
export MANPAGER="less -R --use-color -Dd+b -Du+m"

