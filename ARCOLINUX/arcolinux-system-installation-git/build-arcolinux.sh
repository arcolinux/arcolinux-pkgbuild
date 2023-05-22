#!/bin/bash
#CHROOT=$HOME/Documents/chroot-archlinux
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot
#https://archlinux.org/news/git-migration-completed/
#https://wiki.archlinux.org/title/DeveloperWiki:HOWTO_Be_A_Packager

destination1=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo/x86_64/"
destination2=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/"
destination3=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_iso/x86_64/"
destination4=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_testing/x86_64/"
destination5=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_xlarge/x86_64/"
destination6=$HOME"/ARCO/TEST/"

destiny=$destination1

# 2. makepkg"
# 1. chroot"

CHOICE=1
pwdpath=$(echo $PWD)
pwd=$(basename "$PWD")

#which packages are always going to be build with makepkg or choice 2
#makepkglist=""

for i in $makepkglist
do
  if [[ "$pwd" == "$i" ]] ; then
  CHOICE=2
  fi
done

search1=$(basename "$PWD")
search2=arcolinux

search=$search1
rm -rf /tmp/tempbuild
if test -f "/tmp/tempbuild"; then
  rm /tmp/tempbuild
fi
mkdir /tmp/tempbuild
cp -r $pwdpath/* /tmp/tempbuild/
#cp -r $pwdpath/.* /tmp/tempbuild

cd /tmp/tempbuild/

if [[ $CHOICE == "1" ]] ; then

  tput setaf 2
  echo "#############################################################################################"
  echo "#########        Let us build the package in CHROOT ~/Documents/chroot-archlinux"
  echo "#############################################################################################"
  tput sgr0
  CHROOT=$HOME/Documents/chroot-archlinux
  arch-nspawn $CHROOT/root pacman -Syu
  makechrootpkg -c -r $CHROOT

  echo "Signing the package"
  echo "#############################################################################################"
  gpg --detach-sign $search*pkg.tar.zst

else

  tput setaf 3
  echo "#############################################################################################"
  echo "#########        Let us build the package with MAKEPKG "$(basename `pwd`)
  echo "#############################################################################################"
  tput sgr0
  makepkg --sign
fi


echo "Moving created files to " $destiny
echo "#############################################################################################"
mv -n $search*pkg.tar.zst $destiny
mv -n $search*pkg.tar.zst.sig $destiny
echo "Cleaning up"
echo "#############################################################################################"
echo "deleting unnecessary folders"
echo "#############################################################################################"

if [[ -f $wpdpath/*.log ]]; then
  rm $pwdpath/*.log
fi
if [[ -f $wpdpath/*.deb ]]; then
  rm $pwdpath/*.deb
fi
if [[ -f $wpdpath/*.tar.gz ]]; then
  rm $pwdpath/*.tar.gz
fi

tput setaf 10
echo "#############################################################################################"
echo "###################                       build done                   ######################"
echo "#############################################################################################"
tput sgr0
