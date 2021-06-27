#!/bin/bash

#which packages are needed to build with makepkg or choice 2
makepkglist="sxhkd arcolinux-xmobar-git"

for i in $makepkglist
do
  sudo pacman -S --needed --noconfirm $i
done


tput setaf 8
echo "#############################################################################################"
echo "###################                   installation done                ######################"
echo "#############################################################################################"
tput sgr0
