#!/bin/bash

# generate a list of all available pacman packages
echoerr() { cat <<<"$@" 1>&2; }

if ! [ -e /var/lib/pacman/sync ]; then
	if ! command -v pacman; then
		echoerr "not on an arch system"
		sleep 3
		exit 1
	fi
	echoerr "please update your database"
	sudo pacman -Sy 1>&2
fi

echoerr "updating package list"
pacman -Ssq '.*' | sort -u >packagelist2
pacman -Qq | sort | sort -u >installist
comm -23 packagelist2 installist >packagelist
sed 's/^/:g/g' installist >>packagelist
sed -i 's/$/ /' packagelist
rm installist packagelist2

mkdir -p ~/.cache/instantos
cp packagelist ~/.cache/instantos/packagelist

curl -s https://aur.archlinux.org/packages.gz | gunzip - | sort -u >~/.cache/instantos/aurlist 
