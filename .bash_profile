#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

alias shut='shutdown now'
alias ls='ls --color=auto'

export EDITOR='nvim'

PS1='\[\e[1;36m\]\u\[\e[1;33m\]@\[\e[1;31m\]\h\[\e[m\] [\[\e[1;34m\]\w\[\e[m\]] \$ '

~/bash_unique_profile.sh
