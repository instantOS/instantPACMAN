#!/bin/bash

# instantmenu that lets you choose a package

updatelist() {
    iconf packagedate "$(date '+%D' | sed 's~/~~g')"
    instantpackagelist
}

if ! [ -e ~/.cache/instantos/packagelist ]; then
    notify-send updating package list
    updatelist
    sleep 2
fi

if [ -z "$1" ] || ! [ "$1" = '-i' ]; then
    [ "$(iconf packagedate)" = "$(date '+%D' | sed 's~/~~g')" ] || updatelist &
    instantmenu -l 20 -w -1 -bw 4 -q 'search package' -p "${1:-packages}" <~/.cache/instantos/packagelist
else
    shift 1
    pacman -Ss instantmenu -l 20 -w -1 -bw 4 -q 'search package' -p "${1:-packages}"

fi
