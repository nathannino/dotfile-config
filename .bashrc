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
    echo -en "\e]P00c0c0c" #black
    echo -en "\e]P8767676" #darkgrey
    echo -en "\e]P1c50f1f" #darkred
    echo -en "\e]P9e76856" #red
    echo -en "\e]P213a10e" #darkgreen
    echo -en "\e]PA16c60c" #green
    echo -en "\e]P3c19c00" #brown
    echo -en "\e]PBf9f1a5" #yellow
    echo -en "\e]P40037da" #darkblue
    echo -en "\e]PC3b78ff" #blue
    echo -en "\e]P5881798" #darkmagenta
    echo -en "\e]PDb4009e" #magenta
    echo -en "\e]P63a96dd" #darkcyan
    echo -en "\e]PE61d6d6" #cyan
    echo -en "\e]P7cccccc" #lightgrey
    echo -en "\e]PFf2f2f2" #white
    clear #for background artifacting
fi
neofetch

PS1='\[\e[1;36m\]\u\[\e[1;33m\]@\[\e[0;31m\]\h\[\e[m\] [\[\e[1;34m\]\w\[\e[m\]] \$ '
export EDITOR=nvim
