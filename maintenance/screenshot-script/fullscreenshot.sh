#!/bin/bash

# Default save location or something
cd ~/

# Take the screenshot as soon as possible
SCREENSHOT=~/maintenance/screenshot-script/screenshot.temp
touch $SCREENSHOT
flameshot full -r > $SCREENSHOT

CHOICE=$(printf "save\ncopy\nboth\nsnipping" | dmenu)


if printf $CHOICE | grep -q 'save'
then
	printf "Selected : save file\n"
	
	SAVELOCATION=$(zenity --file-selection --save --confirm-overwrite)
	
	# Continue if we don't have an empty string (not canceled)
	if [ -z "$SAVELOCATION" ]
	then
		printf "aborted, file selection canceled\n"
	else
		mv $SCREENSHOT "$SAVELOCATION.png"
	fi
else
	if printf $CHOICE | grep -q 'copy'
	then
		printf "Selected : Copy to clipboard\n"
		cat $SCREENSHOT | xclip -selection clipboard -target image/png -i
	else
		if printf $CHOICE | grep -q 'both'
		then
			printf "Selected : do both\n"
			
			cat $SCREENSHOT | xclip -selection clipboard -target image/png -i

			SAVELOCATION=$(zenity --file-selection --save --confirm-overwrite)
			
			# Continue if we don't have an empty string (not canceled)
			if [ -z "$SAVELOCATION" ]
			then
				printf "aborted, file selection canceled\n"
			else
				mv $SCREENSHOT "$SAVELOCATION.png"
			fi
		else
			if printf $CHOICE | grep -q 'snipping'
			then
				printf "Selected : snipping tool"
				flameshot gui -d 310
			else
				printf "Invalid choice, aborting\n"
			fi
		fi
	fi
fi


