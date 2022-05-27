#!/bin/bash

read -p "Do you want to install important packages? (Y/n)"

if [[ $REPLY =~ ^[Nn]$ ]]
then
	echo Cancelled
	exit 1
fi
echo "	== Installing yay =="

mkdir ~/git-clones
cd ~/git-glones

git clone "https://aur.archlinux.org/yay-bin.git"
cd yay
makepkg -si

#From here, we can assume that we have yay
yay -Syu
