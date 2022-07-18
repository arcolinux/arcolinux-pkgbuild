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
count=0
dirs=(
arcolinux-arc-aqua
arcolinux-arc-archlinux-blue
arcolinux-arc-arcolinux-blue
arcolinux-arc-azul
arcolinux-arc-azure-dodger-blue
arcolinux-arc-blood
arcolinux-arc-blue-sky
arcolinux-arc-botticelli
arcolinux-arc-bright-lilal
arcolinux-arc-bright-lime-green
arcolinux-arc-carnation
arcolinux-arc-carolina-blue
arcolinux-arc-casablanca
arcolinux-arc-crimson
arcolinux-arc-dawn
arcolinux-arc-emerald
arcolinux-arc-evopop
arcolinux-arc-fern
arcolinux-arc-fire
arcolinux-arc-froly
arcolinux-arc-havelock
arcolinux-arc-hibiscus
arcolinux-arc-light-blue-grey
arcolinux-arc-light-blue-surfn
arcolinux-arc-light-salmon
arcolinux-arc-mandy
arcolinux-arc-mantis
arcolinux-arc-medium-blue
arcolinux-arc-niagara
arcolinux-arc-nice-blue
arcolinux-arc-numix
arcolinux-arc-orchid
arcolinux-arc-pale-grey
arcolinux-arc-paper
arcolinux-arc-pink
arcolinux-arc-polo
arcolinux-arc-punch
arcolinux-arc-red-orange
arcolinux-arc-rusty-orange
arcolinux-arc-sky-blue
arcolinux-arc-slate-grey
arcolinux-arc-smoke
arcolinux-arc-soft-blue
arcolinux-arc-tacao
arcolinux-arc-tangerine
arcolinux-arc-tory
arcolinux-arc-warm-pink
)

for m in "${dirs[@]}"
do
  mkdir -vp $m
done
