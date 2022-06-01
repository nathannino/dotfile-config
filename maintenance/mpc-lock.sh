#!/bin/bash

MPC_CURRENT=$(mpc current)

function mpc_show () {
	clear
	printf "================================================================================================================================\n"
	mpc status
	printf "\n"
	date
	cal
}

if test -n "$MPC_CURRENT" 
then
	mpc play > /dev/null
else
	bash $HOME/maintenance/mpc-play-all.sh > /dev/null
fi


mpc_show
while sleep 1
do
	mpc_show
done
