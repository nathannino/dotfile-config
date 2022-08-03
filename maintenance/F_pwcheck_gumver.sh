#!/usr/bin/bash

pactl info > /dev/null
if test "$?" -ne "0"
then
	systemctl --user restart pipewire
	#systemctl --user restart pipewire-jack
fi
sleep 3
