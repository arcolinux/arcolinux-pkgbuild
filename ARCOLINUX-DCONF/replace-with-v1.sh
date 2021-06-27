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

echo "What do you want to replace?"
read FIND
echo "What do you want to replace it with?"
read REPLACE

find .  -name "PKGBUILD" -type f -exec sed -i "s/$FIND/$REPLACE/g" {} \;
