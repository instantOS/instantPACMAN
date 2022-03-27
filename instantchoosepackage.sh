#!/bin/bash

# instantmenu that lets you choose a package

updatelist() {
    notify-send 'updating package list, please wait'
    iconf packagedate "$(date '+%D' | sed 's~/~~g')"
    instantpackagelist
}

if ! [ -e ~/.cache/instantos/packagelist ]; then
    notify-send updating package list
    updatelist
    sleep 2
fi

if [ $1 = '-i' ]; then
    shift
    [ "$(iconf packagedate)" = "$(date '+%D' | sed 's~/~~g')" ] || updatelist &
    PACKAGE="$(instantmenu -c -l 20 -w -1 -bw 4 -q 'search package' -p "${1:-packages}" <~/.cache/instantos/packagelist)"
else if [ $1 = '-a' ]; then
    shift
    PACKAGE="$(instantmenu -c -l 20 -w -1 -bw 4 -q 'search package' -p "${1:-packages}" <~/.cache/instantos/aurlist)"
else
    PACKAGE="$(pacman -Ssq | instantmenu -c -l 20 -w -1 -bw 4 -q 'search package' -p "${1:-packages}")"
fi;fi

[ -n "$PACKAGE" ] || exit

sed 's/^:.//g' <<<"$PACKAGE" | grep -o '[^ ]*'
