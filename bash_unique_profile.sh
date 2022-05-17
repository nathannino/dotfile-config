#!/usr/bin/bash

# Functions

F_mpc_start () {
	printf "\n"
	mpc clear --quiet
	mpc add --quiet / 
	mpc play
	printf "\n"
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
	printf "\n==================[  "
	date | tr --delete "\n" | xargs -0 printf
	printf "  ]=========================================================================\n"
	neofetch
	printf "================================================================================================================================\n"
	duf -only local
}

F_updateAll () {
	printf "== updating arch packages and AUR packages ==\n  "
	yay -Syu
	printf "\n  == updating flatpak packages ==\n"
	sudo flatpak update
}

#main

#~/maintenance/schedule-git
F_neofetch
if test -z "$(w | grep nathan_n | tail +2)"
then
	F_mpc_start

	echo "Remember to download the Sodium+Iris mod for the orc gang minecraft server"
	
	read -p "- Do you want to update packages (Requires root password) [Y/n] : " -n 1 -r
	printf "\n"
	
	if [[  $REPLY =~ ^[Nn]$ ]]
	then
		mpc play > /dev/null
		printf "== Skipping over yay -Syu and xmonad --recompile ==\n"
		F_startxserver
	else
		mpc play > /dev/null
		./maintenance/update-all.sh && F_startxserver
	fi
else ## Not the first logged in nathan_nino this session
	printf "\n"
	mpc play
	F_startxserver
fi
