#!/usr/bin/bash

### Still part of the very ugly and stupid and not very portable bash music script collection lol

#SONG_TO_PLAY=$(mpc listall | dmenu -l 10 -p 'Add music')
SONG_TO_PLAY=$(mpc listall | rofi -dmenu -multi-select -p 'Add music')
IFS=$'\n'

printf "\n$SONG_TO_PLAY"$'\n'

# Dont try more if it gets canceled
if test -z "$SONG_TO_PLAY"
then
	printf "Song to add is empty, cancelling operation\n"
else
	while IFS= read -r line; do
		mpc add "$line"
	done <<< "$SONG_TO_PLAY"
	mpc play
fi
