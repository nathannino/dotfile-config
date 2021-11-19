#!/usr/bin/bash

# Get the currently playing song from mpc
MPD_CURRENT_PLAYING=$(mpc current)
# And format it
MPD_CURRENT_PLAYING=${MPD_CURRENT_PLAYING##second-drive/}
MPD_CURRENT_PLAYING=${MPD_CURRENT_PLAYING%.mp3}

echo $MPD_CURRENT_PLAYING
