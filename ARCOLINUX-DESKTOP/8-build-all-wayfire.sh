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
# Automatically set the year and month for versioning
YEAR=$(date +%y)   # Gets the current year in two digits, e.g., 25 for 2025
MONTH=$(date +%m)  # Gets the current month in two digits, e.g., 01 for January

# Combine year and month into version format
PKG_VERSION="${YEAR}.${MONTH}"

echo "#############################################################################################"
echo "This builds all the existing PKGBUILDs"
echo "Scans the existing folders"
echo "Be sure you have the highest number for all of them"
echo "#############################################################################################"
echo "Using pkgversion number like ${PKG_VERSION}"
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
arcolinux-wayfire-git \
arcolinux-wayfire-nemesis-git
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
