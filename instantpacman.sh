#!/bin/bash

# simple pacman GUI for instantOS

choicemenu() {
    echo ':g Install
:b 蓮Browse
:r Remove
:b Install AUR package
:b Update
:b  (unfinished) Options
:r Close' | instantmenu -bw 4 -w -1 -h -1 -i -q 'instantPACMAN' -c -l 30
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
*package)
    PACKAGE="$(imenu -i 'enter package name')"
    [ -n "$PACKAGE" ] || exit
    st -e sh -c "(yay -S $PACKAGE || bash) && notify-send 'finished installing '$PACKAGE"
    ;;
*Update)
    st -e sh -c yay
    ;;
*Options)
    CHOICE="$(echo ':g Chaotic-AUR
:r Snap' | instantmenu -bw 4 -w -1 -h -1 -i -q 'instantPACMAN' -c -l 30)"
    case "$CHOICE" in
    *AUR)
        if ! echo 'Chaotic-AUR is a third party repository
that grants access to over 1900 prebuilt AUR packages. 
Please note that all content in the chaotic AUR repository is maintained
by the chaotic and garuda team and is not connected to Arch Linux or instantOS. 
Enable now?' | imenu -C; then
            exit
        fi


        ;;

    esac

    ;;
*close)
    exit
    ;;
esac

instantpackagelist &
