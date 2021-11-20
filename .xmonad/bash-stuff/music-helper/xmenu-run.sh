#!/bin/bash
### This code is ugly, probably only works with bash, is based on copying stackoverflow anwsers,
### but it should be fine **for me** as long as I am using my dotcfg repo for script locations
VAR_WORKING_DIRECTORY="$HOME/.xmonad/bash-stuff/music-helper" # Where the others scripts are located
INF=$'\n'

## Variables
VAR_STATUS="$(mpc status)"
# Repeat
VAR_REPEAT="off"
case "$VAR_STATUS" in
	*"repeat: on"*)
		VAR_REPEAT="on"
		;;
esac
# Random
VAR_RANDOM="off"
case "$VAR_STATUS" in
	*"random: on"*)
		VAR_RANDOM="on"
		;;
esac
# Single
VAR_SINGLE="off"
case "$VAR_STATUS" in
	*"single: on"*)
		VAR_SINGLE="on"
		;;
esac
# Consume
VAR_CONSUME="off"
case "$VAR_STATUS" in
	*"consume: on"*)
		VAR_CONSUME="on"
		;;
esac
# Volume
MPC_VOLUME="$(mpc volume)"
VAR_VOLUME=${MPC_VOLUME//volume: /}
# crossfade
VAR_CROSSFADE="$(mpc crossfade)"
VAR_CROSSFADE=${VAR_CROSSFADE//crossfade: /}


## Current Playlist
VAR_PLAYLIST_SONGS_STEPONE=$(mpc playlist)
if test -z "$VAR_PLAYLIST_SONGS_STEPONE"
then
	VAR_PLAYLIST_SONGS=$'\tNo songs in queue =/\n'
else
	VAR_PLAYLIST_SONGS_STEPONE=$(printf "$VAR_PLAYLIST_SONGS_STEPONE" | sed 's/^/\t/')
		
	VAR_LINENUMBER=1
	while IFS= read -r line; do
	    VAR_PLAYLIST_SONGS="$VAR_PLAYLIST_SONGS$line"$'\n'
	    VAR_PLAYLIST_SONGS="$VAR_PLAYLIST_SONGS"$'\t\t'"Jump to song"$'\t'"mpc play $VAR_LINENUMBER"$'\n'
	    VAR_PLAYLIST_SONGS="$VAR_PLAYLIST_SONGS"$'\t\t'"Remove from session"$'\t'"mpc del $VAR_LINENUMBER"$'\n'
	    let VAR_LINENUMBER+=1
	done <<< "$VAR_PLAYLIST_SONGS_STEPONE"
fi

## Playlist list
VAR_PLAYLIST_LIST_STEPONE=$(mpc lsplaylists)
if test -z "$VAR_PLAYLIST_LIST_STEPONE"
then ## No playlists exists
	VAR_PLAYLIST_LIST=$'\tNo playlists =/\n'
else
	VAR_PLAYLIST_LIST_STEPONE=$(printf "$VAR_PLAYLIST_LIST_STEPONE" | sed 's/^/\t/')

	VAR_LINENUMBER=1
	while IFS= read -r line; do
	    VAR_PLAYLIST_LIST="$VAR_PLAYLIST_LIST$line"$'\n'
	    VAR_PLAYLIST_LIST="$VAR_PLAYLIST_LIST"$'\t\t'"Add to session"$'\t'"mpc load $line && mpc play"$'\n'
	    VAR_PLAYLIST_LIST="$VAR_PLAYLIST_LIST"$'\t\t'"Clear and play"$'\t'"mpc clear && mpc load $line && mpc play"$'\n'
	    VAR_PLAYLIST_LIST="$VAR_PLAYLIST_LIST"$'\t\t\n'
	    VAR_PLAYLIST_LIST="$VAR_PLAYLIST_LIST"$'\t\t'"Delete playlist"$'\t'"mpc rm $line"$'\n'
	    let VAR_LINENUMBER+=1
	done <<< "$VAR_PLAYLIST_LIST_STEPONE"
fi
printf "$VAR_PLAYLIST_LIST"


xmenu "$@" <<EOF | sh &
Current Session
$VAR_PLAYLIST_SONGS
Controls
	Play/Pause				mpc toggle
	Seek					dmenu -p 'Seek [+-](HH:MM:SS or 0-100%) : ' | xargs mpc seek
	Volume ($VAR_VOLUME)			dmenu -p 'Volume % (Current = $VAR_VOLUME) : ' | xargs mpc volume
Player Settings
	Repeat ($VAR_REPEAT)			second-drive/Dreamlandmpc repeat
	Random ($VAR_RANDOM)			mpc random
	Single ($VAR_SINGLE)			mpc single
	Consume ($VAR_CONSUME)			mpc consume
	Crossfade (${VAR_CROSSFADE}s)		dmenu -p 'Crossfade (seconds) (Current = $VAR_CROSSFADE) : ' | xargs mpc crossfade
Session Controls
	Add song				"$VAR_WORKING_DIRECTORY"/add-song-and-play.sh
	Clear					mpc clear
	Crop					mpc crop
	Shuffle					mpc shuffle
Playlists
	Save Current Session as playlist	dmenu -p 'Name of playlist : ' | xargs mpc save	
	
	All Songs
		Add to session			mpc add / && mpc play
		Clear and play			mpc clear && mpc add / && mpc play
	
$VAR_PLAYLIST_LIST
Open ymuse					ymuse
Force rescan					mpc rescan
Stop and drop session				mpc stop; mpc clear
EOF
