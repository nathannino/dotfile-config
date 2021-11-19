#!/usr/bin/bash

# Get the currently playing song from mpc
MPD_CURRENT_PLAYING=$(mpc current)
# And format it
MPD_CURRENT_PLAYING=${MPD_CURRENT_PLAYING//second-drive/}
MPD_CURRENT_PLAYING=${MPD_CURRENT_PLAYING//.mp3/}

## Prepare the printing
if test -z "$MPD_CURRENT_PLAYING"
then
	PRINTING_STRING=" <fn=1></fn> "
else
	PRINTING_STRING=" <fn=1></fn> $MPD_CURRENT_PLAYING "
fi
printf "$PRINTING_STRING"
