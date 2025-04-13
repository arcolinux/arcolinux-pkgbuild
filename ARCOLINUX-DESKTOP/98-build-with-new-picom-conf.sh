#!/bin/bash
#
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
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

echo "This builds the existing projects containing a picom.conf"

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

array="
arcolinux-awesome
arcolinux-berry
arcolinux-bspwm
arcolinux-chadwm
arcolinux-chadwm-nemesis
arcolinux-cwm
arcolinux-dusk
arcolinux-dusk-nemesis
arcolinux-dwm
arcolinux-dwm-nemesis
arcolinux-fvwm3
arcolinux-herbstluftwm
arcolinux-hypr
arcolinux-i3wm
arcolinux-i3wm-db-nemesis
arcolinux-i3wm-forest
arcolinux-icewm
arcolinux-jwm
arcolinux-leftwm
arcolinux-lxqt
arcolinux-nimdow
arcolinux-nimdow-nemesis
arcolinux-openbox
arcolinux-openbox-xtended
arcolinux-qtile
arcolinux-spectrwm
arcolinux-wmderland
arcolinux-worm
arcolinux-xmonad-polybar
arcolinux-xmonad-xmobar
"


if [[ "$response" == [yY] ]]; then

		count=0

		for name in $array ;
		do
			count=$[count+1]
			cd $name"-git"
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
