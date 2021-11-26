#!/usr/bin/bash

### Kinda ugly, sorry. Made to work with xmobar, requires xmenu, mpc and nerd font set as AdditionalFont 1
XMENU_RUN_LOCATION="$HOME/.xmonad/bash-stuff/music-helper/xmenu-run.sh"


# Get the currently playing song from mpc
MPD_CURRENT_PLAYING=$(mpc current)
# And format it
MPD_CURRENT_PLAYING=${MPD_CURRENT_PLAYING//second-drive\//}
MPD_CURRENT_PLAYING=${MPD_CURRENT_PLAYING//.mp3/}
MPD_CURRENT_PLAYING=${MPD_CURRENT_PLAYING//.ogg/}

## Prepare the printing
if test -z "$MPD_CURRENT_PLAYING"
then ## No mpd, go to next thing
	PRINTING_STRING="<action=\`$XMENU_RUN_LOCATION\` button=1><action=\`~/.xmonad/bash-stuff/music-helper/reset-and-play-all.sh\` button=3> <fn=1></fn> </action></action>"
else ## Yes mpd, print that
	MPC_STATUS=$(mpc status)
	PLAYER_STATUS="<fn=1></fn>"
	case "$MPC_STATUS" in
		*\[paused\]*)
			PLAYER_STATUS="<fn=1>契</fn>"
			;;
	esac
	
	## This string is a mess, search it up by using commands instead
	PRINTING_STRING=" <action=\`mpc stop\` button=1> <fn=1></fn> </action><action=\`$XMENU_RUN_LOCATION\` button=13> <fn=1></fn> ""$MPD_CURRENT_PLAYING"" </action><action=\`mpc prev\` button=1> <fn=1>寧</fn> </action><action=\`mpc toggle\` button=1> $PLAYER_STATUS </action><action=\`mpc next\` button=1> <fn=1>嶺</fn> </action>"
fi
printf "$PRINTING_STRING"
