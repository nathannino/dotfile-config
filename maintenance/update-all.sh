#!/bin/sh

F_updateAll () {
	printf "  == updating arch packages and AUR packages ==\n" 
	yay -Syu
	printf "\n  == updating flatpak packages ==\n"
	sudo flatpak update
	printf "\n  == running manual updating scripts =="
	F_osu_lazer
}

F_xmonad_recompile () {
	printf "\n  == Recompiling xmonad ==\n"
	if xmonad --recompile; then
		printf "\n  == Updating done without errors ==\n"
	else
		printf "\n[!] An error occured while trying to recompile xmonad\n** Do not run startx until the error has been fixed **\n"
		exit 100;
	fi

}

F_osu_lazer () {
	printf "\n- ~/second-drive/Games/osu-lazer-bin/osu-update.sh\n"
	cd ~/second-drive/Games/osu-lazer-bin/
	./osu-update.sh
	cd - > /dev/null
}

F_postUpdate () {
	printf "\n  == Updating complete ==\n"
	read -n 1 -r -s -p " - Press anything to review htop - "
	htop
}

F_preUpdate () {
	snownews
}

F_preUpdate
F_updateAll
F_xmonad_recompile
F_postUpdate

exit 0;
