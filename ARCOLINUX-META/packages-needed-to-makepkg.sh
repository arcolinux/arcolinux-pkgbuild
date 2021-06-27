#!/bin/bash

#which packages are needed to build with makepkg or choice 2
makepkglist="lib32-nss lib32-libdbusmenu-gtk2 arcolinux-meta-fun lib32-libindicator-gtk2 lib32-libgpg-error lsof lib32-alsa-plugins lib32-libxss lib32-mesa lib32-openal lib32-libpulse lib32-nvidia-utils lib32-libva lib32-libvdpau steam"

for i in $makepkglist
do
  sudo pacman -S --needed --noconfirm $i
done


tput setaf 8
echo "#############################################################################################"
echo "###################                   installation done                ######################"
echo "#############################################################################################"
tput sgr0
