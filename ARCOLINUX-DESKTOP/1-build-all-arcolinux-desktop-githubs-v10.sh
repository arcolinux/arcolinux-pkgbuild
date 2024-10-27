#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
echo "#############################################################################################"
echo
echo "This builds all the existing pkgbuilds"
echo "Scans the existing folders"
echo "Be sure you have the highest number for all of them"
echo
echo "#############################################################################################"
echo "Give the pkgversion number like 24.01"
echo "#############################################################################################"

read pkgver

echo "#############################################################################################"
echo "You typed " $pkgver
echo "#############################################################################################"
echo
echo "#############################################################################################"
echo "Give the pkgrelease number like 01"
echo "#############################################################################################"

read pkgrel

echo "#############################################################################################"
echo "You typed " $pkgrel
echo "#############################################################################################"
echo
echo "#############################################################################################"
echo "Continue ?  (y/Y)"
echo "#############################################################################################"
read response

#arcolinux-dwm-git \
#arcolinux-enlightenment-git \

array="
arcolinux-awesome-git \
arcolinux-berry-git \
arcolinux-bspwm-git \
arcolinux-budgie-git \
arcolinux-chadwm-git \
arcolinux-chadwm-nemesis-git \
arcolinux-cinnamon-git \
arcolinux-cutefish-git \
arcolinux-cwm-git \
arcolinux-deepin-git \
arcolinux-dk-git
arcolinux-dusk-git \
arcolinux-dusk-nemesis-git \
arcolinux-dwm-git \
arcolinux-dwm-nemesis-git \
arcolinux-enlightenment-git \
arcolinux-fvwm3-git \
arcolinux-gnome-git \
arcolinux-herbstluftwm-git \
arcolinux-hyprland-git \
arcolinux-hyprland-nemesis-git \
arcolinux-i3wm-db-nemesis-git \
arcolinux-i3wm-forest-git \
arcolinux-i3wm-git \
arcolinux-icewm-git \
arcolinux-jwm-git \
arcolinux-leftwm-git \
arcolinux-lxqt-git \
arcolinux-mate-git \
arcolinux-nimdow-git \
arcolinux-nimdow-nemesis-git \
arcolinux-openbox-git \
arcolinux-openbox-xtended-git \
arcolinux-openboxb-git \
arcolinux-plasma-git \
arcolinux-plasma-nemesis-git \
arcolinux-qtile-distrotube-git \
arcolinux-qtile-git \
arcolinux-spectrwm-git \
arcolinux-sway-git \
arcolinux-ukui-git \
arcolinux-wayfire-git \
arcolinux-wayfire-nemesis-git \
arcolinux-wmderland-git \
arcolinux-worm-git \
arcolinux-xmonad-polybar-git \
arcolinux-xmonad-xmobar-git \
arconet-xfce \
arconet-xfce-nemesis
"

if [[ "$response" == [yY] ]]; then

		count=0

		for name in $array ;
		do
			count=$[count+1]
			cd $name
			tput setaf 1;echo "Github "$count;tput sgr0;
			sed -i "s/\(^pkgver=\).*/\1$pkgver/" PKGBUILD
			sed -i "s/\(^pkgrel=\).*/\1$pkgrel/" PKGBUILD

			./build*
			echo "#############################################################################################"
			echo "################  "$(basename `pwd`)" done"
			echo "#############################################################################################"
			cd ..
		done

		echo "#############################################################################################"
		echo "###################                 Script finished                      ####################"
		echo "#############################################################################################"

    else
    	echo "#############################################################################################"
      echo "Nothing has been changed.";
fi
