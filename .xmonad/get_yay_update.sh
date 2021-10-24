#!/usr/bin/bash
yay -Qu | grep -o "\->" | wc -l | xargs printf
