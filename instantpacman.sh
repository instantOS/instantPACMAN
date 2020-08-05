#!/bin/bash

# simple pacman GUI for instantOS

choicemenu() {
    echo ':g install
:r remove
:b enter exact package name
:r close' | instantmenu -bw 4 -w -1 -h -1 -q 'instantPACMAN' -c -l 30
}

CHOICE="$(choicemenu)"

case "$CHOICE" in
*install)
    PACKAGE="$(instantchoosepackage)"
    echo "installing $PACKAGE"
    ;;
esac
