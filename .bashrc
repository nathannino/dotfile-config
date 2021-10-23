#
# ~/.bashrc
#

# PS1='\u@\h [\w] \$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias schedule-git='~/maintenance/schedule-git'
alias shut='shutdown now'

dotcfg() { git --git-dir="$HOME/dotconfig/.git/" --work-tree="$HOME" "$@" ; } # Set up 

echo 
clear
neofetch

PS1='\[\e[1;36m\]\u\[\e[1;33m\]@\[\e[0;31m\]\h\[\e[m\] [\[\e[1;34m\]\w\[\e[m\]] \$ '
export EDITOR=nvim
