#!/bin/bash
#CHROOT=$HOME/Documents/chroot-archlinux
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot
#https://archlinux.org/news/git-migration-completed/
#https://wiki.archlinux.org/title/DeveloperWiki:HOWTO_Be_A_Packager
##################################################################################################################
# Written to be used on 64 bits computers
# Author  :   Erik Dubois
# Website   :   http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

#tput setaf 0 = black 
#tput setaf 1 = red 
#tput setaf 2 = green
#tput setaf 3 = yellow 
#tput setaf 4 = dark blue 
#tput setaf 5 = purple
#tput setaf 6 = cyan 
#tput setaf 7 = gray 
#tput setaf 8 = light blue

destination1=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo/x86_64/"
destination2=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/"
destination3=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_iso/x86_64/"
destination4=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_testing/x86_64/"
destination5=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_xlarge/x86_64/"
destination6=$HOME"/ARCO/ARCOLINUX-ARCHIVE/packages"

destiny=$destination4

#long path
wpdpath=$(dirname $(readlink -f $(basename `pwd`)))
pwdpath=$(echo $PWD)
pwd=$(basename "$PWD")

search1=$(basename "$PWD")
search2=arcolinux
search=$search1

# choice 1 = chroot"
# choice 2 = makepkg"

CHOICE=1

#which packages are always going to be build with makepkg or choice 2
#makepkglist=""

# for i in $makepkglist
# do
#   if [[ "$pwd" == "$i" ]] ; then
#   CHOICE=2
#   fi
# done

removepackages(){
  
    # paru-bin and paru-git
  if [ $search == "paru" ] ; then
    search="paru-2"
    tput setaf 1; echo "Keep an eye on " $search;tput sgr0
  fi

  # btrfs-assistant
  if [ $search == "btrfs-assistant" ] ; then
    search="btrfs-assistant-2"
    tput setaf 1; echo "Keep an eye on " $search;tput sgr0
  fi

  # btrfsmaintenance
  if [ $search == "btrfsmaintenance" ] ; then
    search="btrfsmaintenance-0"
    tput setaf 1; echo "Keep an eye on " $search;tput sgr0
  fi

  # wayfire
  if [ $search == "wayfire" ] ; then
    search="wayfire-0"
    tput setaf 1; echo "Keep an eye on " $search;tput sgr0
  fi

  if [ $(ls $destiny*$search*zst | wc -l) -gt 1 ]; then
    rm -v $destiny*$search*
  fi
  
  echo "#############################################################################################"
  echo "Added " $search "to /tmp/removed"
  echo "#############################################################################################"
  echo "$search" | tee -a /tmp/removed
}

createcurrentversion(){
#check current version
pkgver=$(grep -m1 "pkgver" PKGBUILD | cut -d= -f2)
pkgrel=$(grep -m1 "pkgrel" PKGBUILD | cut -d= -f2)
epoch=$(grep -m1 "epoch" PKGBUILD | cut -d= -f2)
echo "pkgver = "$pkgver
echo "pkgver="$pkgver > .current-version
echo "pkgrel = "$pkgrel
echo "pkgrel="$pkgrel >> .current-version
echo "epoch = "$epoch
echo "epoch="$epoch >> .current-version
}

checkversion(){
#check version
pkgver=$(grep -m1 "pkgver" PKGBUILD | cut -d= -f2)
pkgrel=$(grep -m1 "pkgrel" PKGBUILD | cut -d= -f2)
epoch=$(grep -m1 "epoch" PKGBUILD | cut -d= -f2)
oldpkgver=$(grep -m1 "pkgver" .previous-version | cut -d= -f2)
oldpkgrel=$(grep -m1 "pkgrel" .previous-version | cut -d= -f2)
oldepoch=$(grep -m1 "epoch" .previous-version | cut -d= -f2)

  tput setaf 3;
  echo "######################"
  echo "Previous version"
  echo "######################"
  echo "oldpkgver = "$oldpkgver
  echo "oldpkgrel = "$oldpkgrel
  echo "oldepoch = "$oldepoch
  echo "######################"
  echo "New version"
  echo "######################"
  echo "pkgver = "$pkgver
  echo "pkgver="$pkgver > .current-version
  echo "pkgrel = "$pkgrel
  echo "pkgrel="$pkgrel >> .current-version
  echo "epoch = "$epoch
  echo "epoch="$epoch >> .current-version
  echo "We need to build "$name
  echo "######################"
  tput sgr0
}

createcurrentversion
checkversion

if [[ $pkgver != $oldpkgver  ||  $pkgrel != $oldpkgrel  || $epoch != $oldepoch ]] ; then
  buildneeded="true"
else
  buildneeded="false"
fi


if [ $buildneeded == "false" ]; then
  echo "#############################################################################################"
  tput setaf 2;echo "No need to build "$name;tput sgr0
  echo "#############################################################################################"
  sleep 1
fi


if [ $buildneeded = "true" ]; then

  if [ -d /tmp/tempbuild ]; then
    rm -rf /tmp/tempbuild
  fi
  mkdir /tmp/tempbuild
  cp -r $pwdpath/* /tmp/tempbuild/

  cd /tmp/tempbuild/

  if [[ $CHOICE == "1" ]] ; then
    #building in chroot
    tput setaf 2
    echo "#############################################################################################"
    echo "#########        Let us build the package in CHROOT ~/Documents/chroot-archlinux"
    echo "#############################################################################################"
    tput sgr0

    CHROOT=$HOME/Documents/chroot-archlinux
    arch-nspawn $CHROOT/root pacman -Syu
    makechrootpkg -c -r $CHROOT
    if [ $? -eq 0 ]; then
      success="true"
    else
      success="false"
    fi
  else
    #building with makepkg - not in chroot
    tput setaf 3
    echo "#############################################################################################"
    echo "#########        Let us build the package with MAKEPKG "$(basename `pwd`)
    echo "#############################################################################################"
    tput sgr0
    makepkg -s --sign
    if [ $? -eq 0 ]; then
      success="true"
    else
      success="false"
    fi
  fi

  echo "#############################################################################################"
  echo "REPO - Removing any old files from " $destiny
  echo "#############################################################################################"
  removepackages
  echo "#############################################################################################"

  echo "#############################################################################################"
  echo "REPO - Copying created files to " $destiny
  echo "#############################################################################################"

  tput setaf 2
  cp -nv *$search*pkg.tar.zst $destiny
  tput sgr0

  # start archive
  firstLetter="$(echo $search | head -c 1)"

  echo "#############################################################################################"
  echo "ARCHIVE - Moving created files to " $destination6/$firstLetter/$search1
  echo "#############################################################################################"

  [ -d $destination6/$firstLetter ] && echo "Directory " $firstLetter " exists" || mkdir $destination6/$firstLetter
  [ -d "$destination6/$firstLetter/$search1" ] && echo "Directory " $search1 " exists" || mkdir "$destination6/$firstLetter/$search1"
  tput setaf 2
  cp -nv $search*pkg.tar.zst "$destination6/$firstLetter/$search1"
  tput sgr0
  # echo "Let us sign the packages without a .sig"

  # count=0
  # cd $destination6/$firstLetter/$search1
  # for name in $(ls *.tar.zst); do
  #   count=$[count+1]
  #   if [ ! -f $name.sig ];then  
  #     tput setaf 1;echo $count " : signing " $name;tput sgr0;
  #     gpg --detach-sign $name
  #   fi
  # done

  echo "#############################################################################################"
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

  tput setaf 11
  echo "#############################################################################################"
  echo "###################                       build done                   ######################"
  echo "#############################################################################################"
  tput sgr0
  
  cp $pwdpath/.current-version $pwdpath/.previous-version

fi
