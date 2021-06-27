#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

search=arcolinux

#### via clean chroot

CHROOT=$HOME/Documents/chroot-arcolinux
arch-nspawn $CHROOT/root pacman -Syu
makechrootpkg -c -r $CHROOT

echo "signing the package"
gpg --detach-sign $search*pkg.tar.zst


# or via makepkg

#makepkg --sign


#### cleaning up

echo "moving created files to repo"
mv $search*pkg.tar.zst ../../arcolinux_repo/x86_64/
mv $search*pkg.tar.zst.sig ../../arcolinux_repo/x86_64/



echo "Cleaning up"
echo "###########################################################"
echo

echo "deleting unnecessary folders"
echo "###########################################################"
echo

rm -rf pkg src

echo "deleting unnecessary files"
echo "###########################################################"
echo

find .  -not -name 'PKGBUILD'\
        -not -name 'MKPKG'\
        -not -name 'LICENCE.md'\
        -not -name 'LICENSE'\
        -not -name '*arcolinux*'\
        -not -name '*install*'\
        -not -name '*.cfg'\
        -not -name '*.conf'\
        -not -name '*.desc'\
        -not -name '*.desktop'\
        -not -name '*.hook'\
        -not -name '*.install'\
        -not -name '*.jpg'\
        -not -name '*.patch'\
        -not -name '*.png'\
        -not -name '*.po'\
        -not -name '*.prf'\
        -not -name '*.protocol'\
        -not -name '*.py'\
        -not -name '*.service'\
	      -not -name '*.sh'\
	      -not -name '*.txt'\
        -delete


echo "################################################################"
echo "###################    build done         ######################"
echo "################################################################"
