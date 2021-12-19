#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

alias shut='shutdown now'
alias ls='ls --color=auto'

export TERM='linux-16color'


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

export EDITOR='nvim'
export SUDO_ASKPASS='/usr/lib/ssh/x11-ssh-askpass'

PS1='\[\e[1;36m\]\u\[\e[1;33m\]@\[\e[1;31m\]\h\[\e[m\] [\[\e[1;34m\]\w\[\e[m\]] \$ '

~/bash_unique_profile.sh
