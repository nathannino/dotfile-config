#!/usr/bin/bash

# Make sure that yay will get the right values later
pacman -Qu > /dev/null

# Get the amount of package updates
yay -Qsu | grep -o "\->" | wc -l | xargs printf
