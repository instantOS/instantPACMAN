#!/bin/bash

# generate a list of all available pacman packages

if ! [ -e /var/lib/pacman/sync ]; then
	if ! command -v pacman; then
		echo "not on an arch system"
		sleep 3
		exit 1
	fi
	echo "please update your database"
	sudo pacman -Sy
fi

echo "updating package list"
pacman -Ssq '.*' | sort -u >packagelist2
pacman -Qq | sort | sort -u >installist
comm -23 packagelist2 installist >packagelist
sed 's/^/:g/g' installist >>packagelist
sed -i 's/$/ /' packagelist
rm installist packagelist2

mkdir -p ~/.cache/instantosy
cp packagelist ~/.cache/instantos/packagelist
