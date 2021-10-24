#
# ~/.bashrc
#

# PS1='\u@\h [\w] \$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERMINFO="$HOME/.terminfo"
export TERM=linux-16color

alias ls='ls --color=auto'
alias schedule-git='~/maintenance/schedule-git'
alias shut='shutdown now'

dotcfg() { git --git-dir="$HOME/dotconfig/.git/" --work-tree="$HOME" "$@" ; } # Set up 

if [ "$TERM" = "linux-16color" ]; then
    echo -en "\e]P0222222" #black
    echo -en "\e]P8222222" #darkgrey
    echo -en "\e]P1803232" #darkred
    echo -en "\e]P9982b2b" #red
    echo -en "\e]P25b762f" #darkgreen
    echo -en "\e]PA89b83f" #green
    echo -en "\e]P3aa9943" #brown
    echo -en "\e]PBefef60" #yellow
    echo -en "\e]P4324c80" #darkblue
    echo -en "\e]PC2b4f98" #blue
    echo -en "\e]P5706c9a" #darkmagenta
    echo -en "\e]PD826ab1" #magenta
    echo -en "\e]P692b19e" #darkcyan
    echo -en "\e]PEa1cdcd" #cyan
    echo -en "\e]P7ffffff" #lightgrey
    echo -en "\e]PFdedede" #white
    clear #for background artifacting
fi
neofetch

PS1='\[\e[1;36m\]\u\[\e[1;33m\]@\[\e[0;31m\]\h\[\e[m\] [\[\e[1;34m\]\w\[\e[m\]] \$ '
export EDITOR=nvim
