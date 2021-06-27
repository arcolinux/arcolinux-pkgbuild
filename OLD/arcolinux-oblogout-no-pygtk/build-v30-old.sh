#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

destination1="/home/erik/ARCOLINUX-REPO/arcolinux_repo/x86_64/"
destination2="/home/erik/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/"
destination3="/home/erik/ARCOLINUX-REPO/arcolinux_repo_iso/x86_64/"
destination4="/home/erik/ARCOLINUX-REPO/arcolinux_repo_testing/x86_64/"
destination5="/home/erik/ARCOLINUX-REPO/arcolinux_repo_xlarge/x86_64/"

destiny=$destination4

# 2. makepkg"
# 1. chroot"

CHOICE=2

search1=$(basename "$PWD")
search2=arcolinux

search=$search1

tput setaf 2
echo "#############################################################################################"
echo "#########        Let us build the package "$(basename `pwd`)
echo "#############################################################################################"
tput sgr0

case $CHOICE in

    2 )
    makepkg --sign
    ;;

    1 )
    CHROOT=$HOME/Documents/chroot-arcolinux
    arch-nspawn $CHROOT/root pacman -Syu
    makechrootpkg -c -r $CHROOT

    echo "Signing the package"
    echo "#############################################################################################"
    gpg --detach-sign $search*pkg.tar.zst

    ;;
esac

echo "Moving created files to " $destiny
echo "#############################################################################################"
mv $search*pkg.tar.zst $destiny
mv $search*pkg.tar.zst.sig $destiny
echo "Cleaning up"
echo "#############################################################################################"
echo "deleting unnecessary folders"
echo "#############################################################################################"

rm -rf pkg src
rm -rf $search1

echo "deleting unnecessary files"
echo "#############################################################################################"

find .   -not -name Makefile\
		 -not -name readme.install\
		 -not -name 'PKGBUILD'\
		 -not -name 'MKPKG'\
		 -not -name 'LICENCE.md'\
		 -not -name 'install'\
		 -not -name '*.prf'\
		 -not -name '*.hook'\
		 -not -name '*.conf'\
		 -not -name 'LICENSE'\
		 -not -name 'build-v*'\
		 -not -name 'modprobe.d*'\
		 -not -name '*.install'\
		 -not -name '*.patch'\
		 -not -name '*.png'\
		 -not -name '*.jpg'\
     -not -name '*.svg'\
     -not -name '*.txt'\
		 -not -name '*.cfg'\
		 -not -name '*.desktop'\
     -not -name 'main.py'\
     -not -name 'module.desc'\
     -not -name '*eula*'\
     -not -name 'get_cdm_version.c'\
     -not -name '*.protocol'\
     -not -name '*.sh'\
     -not -name '*.etcher'\
     -not -name '*.service'\
		 -delete

tput setaf 8
echo "#############################################################################################"
echo "###################                       build done                   ######################"
echo "#############################################################################################"
tput sgr0
