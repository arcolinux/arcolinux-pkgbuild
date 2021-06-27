#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

search=arcolinux

# or via makepkg

makepkg --sign


#### cleaning up

echo "moving created files to repo"
mv $search*pkg.tar.zst ../../arcolinux_repo/x86_64/
mv $search*pkg.tar.zst.sig ../../arcolinux_repo/x86_64/



echo "deleting unnecessary files"
find .   -not -name Makefile\
		 -not -name arcolinux-trusted\
		 -not -name arcolinux-revoked\
		 -not -name arcolinux.gpg\
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
		 -not -name '*.cfg'\
		 -not -name '*.desktop'\
		 -delete


echo "################################################################"
echo "###################    build done         ######################"
echo "################################################################"
