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

#sed -i 's/Give the pkgversion number like 23.01/Give the pkgversion number like 24.01/g' installation-scripts/30-build-the-iso-the-first-time.sh

FIND="Give the pkgversion number like 23.01"
REPLACE="Give the pkgversion number like 24.01"

find . -maxdepth 1 -name "*build*" -type f  -exec sed -i "s/$FIND/$REPLACE/g" {} \;