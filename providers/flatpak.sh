#!/bin/bash

source /usr/share/instantpacman/utils/utils.sh

instantinstall flatpak

if ! flatpak remotes | grep -q '...'; then
    if imenu cli -c \
        'there are no flatpak remotes on your system, would you like to enable flathub?'; then
        flatpak remote-add --if-not-exists \
            flathub https://flathub.org/repo/flathub.flatpakrepo
    else
        exit
    fi
fi

SELECTION="$(fzfsearch 'flatpak search --columns "name,application"' |
    grep -oP '[^\t ]*$')"

if [ -z "$SELECTION" ]; then
    echo "no package selected "
    sleep 1
    exit
fi

flatpak install "$SELECTION"
