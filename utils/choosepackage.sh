#!/bin/bash

# instantmenu that lets you choose a package
source /usr/share/instantpacman/utils/utils.sh

updatelist() {
    notify-send 'updating package list, please wait'
    runutil packagelist
}

if ! [ -e ~/.cache/instantos/packagelist ]; then
    notify-send updating package list
    updatelist
    sleep 2
fi

PACKAGELIST="$(cat ~/.cache/instantos/packagelist)"

if [ -z "$1" ] || ! [ "$1" = '-i' ]; then
    if iconf w packagedate; then
        updatelist &
    fi
    PACKAGE="$(instantmenu -c -l 20 -w -1 -bw 4 \
        -q 'search package' -p "${1:-packages}" <<<"$PACKAGELIST")"
else
    shift 1
    PACKAGE="$(
        pacman -Q | sed 's/[^ ]*$//g' |
            instantmenu -c -l 20 -w -1 -bw 4 \
                -q 'search package' -p "${1:-packages}"
    )"
fi

[ -n "$PACKAGE" ] || exit

sed 's/^:.//g' <<<"$PACKAGE" | grep -o '[^ ]*'
