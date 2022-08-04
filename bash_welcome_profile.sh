#!/usr/bin/bash

# Functions

GUM_TTY="Continue to tty"
GUM_STARTX="Start graphical environnement (GUI)"
GUM_UPDATE="Update (Requires root password)"
GUM_HELP="View Help file (Has list of keybindings required to use the graphical environnement)"
GUM_MPC="Next song"
HELP_FILE=~/README.txt

F_mpc_start () {
	printf "\n"
	mpc clear --quiet
	mpc add --quiet / 
	mpc play
}

F_mpc_stop() {
	mpc clear
}

F_startxserver () {
		read -p "- Do you want to start up an Xserver [Y/n] : " -n 1 -r
		echo 

		if [[  $REPLY =~ ^[Nn]$ ]]; then
			printf "\nWelcome to Arch Linux! -- Need help? Type this > \e[1;34mcat README.txt\n\e[0m"
		else
			startx
		fi
}


F_neofetch () {
	printf "\n"
	./maintenance/banner.sh
}

F_updateAll () {
	printf "== Updating arch packages and AUR packages ==\n  "
	yay -Syu
	printf "\n  == Updating flatpak packages ==\n"
	sudo flatpak update
	printf "\n  == Updating complete ==\n"
	read -n 1 -r -s -p "Press anything to review htop"
	htop
}

#main

#~/maintenance/schedule-git
F_neofetch
if test -z "$(w | grep nathan_n | tail +2)"
then
	gum spin --spinner="points" --title="Waiting for audio service" ./maintenance/F_pwcheck_gumver.sh
	
	F_mpc_start

	while sleep 0
	do
		echo "================[ Select an option  ]===================="
		CHOICE=$(gum choose "$GUM_HELP" "$GUM_STARTX" "$GUM_UPDATE" "$GUM_MPC" "$GUM_TTY")
		if test "$CHOICE" = "$GUM_TTY"
		then
			printf "\nWelcome to Arch Linux! -- Need help? Type this > \e[1;34mcat README.txt\n\e[0m"
			exit 0;
		else
			if test "$CHOICE" = "$GUM_HELP"
			then
				echo "================[ README.txt (for graphical environement) ]===================="
				cat "$HELP_FILE"
			else
				if test "$CHOICE" = "$GUM_UPDATE"
				then
					./maintenance/update-all.sh
				else
					if test "$CHOICE" = "$GUM_STARTX"
					then
						startx
						exit 0;
					else
						if test "$CHOICE" = "$GUM_MPC"
						then
							mpc next
						else	
							printf "\nWelcome to Arch Linux! -- Need help? Type this > \e[1;34mcat README.txt\n\e[0m"
							exit 0;
						fi
					fi
				fi
			fi
		fi
	done

	#read -p "- Do you want to update packages (Requires root password) [Y/n] : " -n 1 -r
	#printf "\n"
	
	#if [[  $REPLY =~ ^[Nn]$ ]]
	#then
	#	mpc play > /dev/null
	#	printf "== Skipping over yay -Syu and xmonad --recompile ==\n"
	#	F_startxserver
	#else
	#	mpc play > /dev/null
	#	./maintenance/update-all.sh && F_startxserver
	#fi
else ## Not the first logged in nathan_nino this session
	printf "\n"
	F_pwcheck
	mpc play
	F_startxserver
fi
