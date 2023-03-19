#!/bin/bash

source /usr/share/instantpacman/utils/utils.sh

SELECTION="$(fzfsearch "$(utilpath searchaur)")"

if [ -z "$SELECTION" ]; then
    echo "no package selected "
    sleep 1
    exit
fi

yay -S "$SELECTION"
