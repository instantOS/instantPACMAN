#!/bin/bash

# simple pacman GUI for instantOS

choicemenu() {
    echo ':g Install
:b 蓮Browse
:r Remove
:b Enter exact package name
:b Update
:r Close' | instantmenu -bw 4 -w -1 -h -1 -q 'instantPACMAN' -c -l 30
}

CHOICE="$(choicemenu)"

[ -n "$CHOICE" ] || exit

case "$CHOICE" in
*Install)
    PACKAGE="$(instantchoosepackage)"
    [ -n "$PACKAGE" ] || exit
    echo "installing $PACKAGE"
    st -e sh -c "(yay -S $PACKAGE || bash) && notify-send 'finished installing '$PACKAGE"
    ;;
*Remove)
    PACKAGE="$(instantchoosepackage -i)"
    [ -n "$PACKAGE" ] || exit
    st -e bash -c "(yay -R $PACKAGE || bash) && notify-send finished\ uninstalling\ $PACKAGE; sleep 4"
    ;;
*Browse)
    pamac-manager &
    exit
    ;;
*name)
    PACKAGE="$(imenu -i 'enter package name')"
    [ -n "$PACKAGE" ] || exit
    st -e sh -c "(yay -S $PACKAGE || bash) && notify-send 'finished installing '$PACKAGE"
    ;;
*Update)
    st -e sh -c yay
    ;;
*close)
    exit
    ;;
esac

instantpackagelist &
