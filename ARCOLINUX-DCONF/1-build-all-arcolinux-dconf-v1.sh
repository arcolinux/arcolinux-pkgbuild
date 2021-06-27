#!/bin/bash
#
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
echo "#################################################"
echo
echo "This builds all the existing pkgbuilds"
echo "Scans the existing folders"
echo "Be sure you have the highest number for all of them"
echo
echo "#################################################"
echo "Give the pkgversion number like 19.12"
echo "#################################################"

read pkgver

echo "#################################################"
echo "You typed " $pkgver
echo "#################################################"
echo
echo "#################################################"
echo "Give the pkgrelease number like 3"
echo "#################################################"

read pkgrel

echo "#################################################"
echo "You typed " $pkgrel
echo "#################################################"
echo
echo "#################################################"
echo "Continue ?  (y/Y)"
echo "#################################################"
read response

if [[ "$response" == [yY] ]]; then

		count=0

		for name in $(ls -d arcolinux*dconf*/); do
			count=$[count+1]
			cd $name
			tput setaf 1;echo "Github "$count;tput sgr0;
			sed -i "s/\(^pkgver=\).*/\1$pkgver/" PKGBUILD
			sed -i "s/\(^pkgrel=\).*/\1$pkgrel/" PKGBUILD

			./build*
			echo "#################################################"
			echo "################  "$(basename `pwd`)" done"
			echo "#################################################"
			cd ..
		done

		echo "################################################################"
		echo "###################      Script finished    ####################"
		echo "################################################################"

    else
    	echo "################################################################"
      echo "Nothing has been changed.";
fi
