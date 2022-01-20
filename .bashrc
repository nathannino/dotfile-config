#
# ~/.bashrc
#

# PS1='\u@\h [\w] \$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#export TERMINFO="$HOME/.terminfo"

alias ls='ls --color=auto'
alias schedule-git='~/maintenance/schedule-git'
alias shut='shutdown now'
alias javac16='javac --release 16'

dotcfg() { git --git-dir="$HOME/dotconfig/.git/" --work-tree="$HOME" "$@" ; } # Set up 

# color scheme
if command -v theme.sh > /dev/null; then
	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"

	# Optional

	#Binds C-o to the previously active theme.
	bind -x '"\C-o":"theme.sh $(theme.sh -l|tail -n2|head -n1)"'

	alias th='theme.sh -i'

	# Interactively load a light theme
	alias thl='theme.sh --light -i'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i'
fi

#if [ "$TERM" = "linux-16color" ]; then
#    echo -en "\e]P00c0c0c" #black
#    echo -en "\e]P8767676" #darkgrey
#    echo -en "\e]P1c50f1f" #darkred
#    echo -en "\e]P9e76856" #red
#    echo -en "\e]P213a10e" #darkgreen
#    echo -en "\e]PA16c60c" #green
#    echo -en "\e]P3c19c00" #brown
#    echo -en "\e]PBf9f1a5" #yellow
#    echo -en "\e]P40037da" #darkblue
#    echo -en "\e]PC3b78ff" #blue
#    echo -en "\e]P5881798" #darkmagenta
#    echo -en "\e]PDb4009e" #magenta
#    echo -en "\e]P63a96dd" #darkcyan
#    echo -en "\e]PE61d6d6" #cyan
#    echo -en "\e]P7cccccc" #lightgrey
#    echo -en "\e]PFf2f2f2" #white
#    clear #for background artifacting
#fi
neofetch

PS1='\[\e[1;36m\]\u\[\e[1;33m\]@\[\e[1;31m\]\h\[\e[m\] [\[\e[1;36m\]\w\[\e[m\]] \$ '
export EDITOR=nvim
