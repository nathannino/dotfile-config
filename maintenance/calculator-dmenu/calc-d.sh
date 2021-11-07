#!/bin/bash

CALCRESAULT=$(calc "$@")

CALCRESAULT="${CALCRESAULT:1}"

DMENURESAULT=$(printf "$CALCRESAULT" | dmenu -p "Calc Result :")

echo $DMENURESAULT
echo $CALCRESAULT

if printf "$DMENURESAULT" | grep -q "$CALCRESAULT"
then
	printf "$CALCRESAULT" | xclip -selection clipboard 
fi

