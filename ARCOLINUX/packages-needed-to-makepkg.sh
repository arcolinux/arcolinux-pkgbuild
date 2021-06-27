#!/bin/bash

#which packages are needed to build with makepkg or choice 2
makepkglist="xfce4-dev-tools lib32-libjpeg6-turbo lib32-libpng12 gobject-introspection thunar pamac-aur htop thunar pavucontrol pamixer xfce4-power-manager"

for i in $makepkglist
do
  sudo pacman -S --needed --noconfirm $i
done


tput setaf 8
echo "#############################################################################################"
echo "###################                   installation done                ######################"
echo "#############################################################################################"
tput sgr0
