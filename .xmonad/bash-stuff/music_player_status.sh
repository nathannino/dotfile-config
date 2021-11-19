#!/usr/bin/bash

# Get the currently playing song from mpc
MPD_CURRENT_PLAYING=$(mpc current)
# And format it
MPD_CURRENT_PLAYING=${MPD_CURRENT_PLAYING//second-drive/}
MPD_CURRENT_PLAYING=${MPD_CURRENT_PLAYING//.mp3/}

## Prepare the printing
if test -z "$MPD_CURRENT_PLAYING"
then
	PRINTING_STRING="<action=\`notify-send music 'This will open a simple xmenu thing'\` button=1> <fn=1></fn> </action>"
else
	PRINTING_STRING="<action=\`notify-send music 'This will open a simple xmenu thing'\` button=1> <fn=1></fn> $MPD_CURRENT_PLAYING </action> <fn=1></fn> "
fi
printf "$PRINTING_STRING"
