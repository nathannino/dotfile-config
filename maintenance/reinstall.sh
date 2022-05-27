#!/bin/bash

echo "Welcome to the post install setup script, to get the important packages installed and have the dotcfg configs all ready to go"

echo "This script will not check for error codes, so please only terminate it using \"^c\""

echo "Also, please do not terminate it after it has finished installing the packages, as there are some configuration required"

read -p "Do you want to continue? (Y/n)"

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

PACKAGES=$(echo $(cat ~/maintenance/reinstall-packages)) #Get package list in cleaned form "because bash echo funny"

yay -S $PACKAGES
