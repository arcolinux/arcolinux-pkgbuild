#!/bin/bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 		: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "Add content after this line match?"
read FIND
echo "What do I add after the matching line?"
read REPLACE

find .  -name "PKGBUILD" -type f -exec sed -i "/$FIND/a $REPLACE" {} \;
