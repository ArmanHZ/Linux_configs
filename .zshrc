# Created by newuser for 5.8

autoload -U colors && colors
[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

PS1=%{$(tput setaf 131)%}"["%{$(tput setaf 140)%}%n%{$(tput setaf 96)%}"@"%{$(tput setaf 133)%}%m" "%{$(tput setaf 173)%}%c%{$(tput setaf 131)%}"]"%{$(tput setaf 130)%}"$ "%{$reset_color%}

# Basic auto/tab complete:
zstyle ':completion:*' menu select
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Case in-sensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Load aliases
source $HOME/.config/Scripts/zsh_aliases/aliasesrc

autoload -Uz promptinit
promptinit

# ctrl + arrowkey movement
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

