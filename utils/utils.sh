#!/bin/bash

# continually rerun command $1 to get new results with fzf
fzfsearch() {
    RG_PREFIX="$1 "
    INITIAL_QUERY=""
    export FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'"

    fzf --prompt "search package> " \
        --bind "change:reload:$RG_PREFIX {q} || true" \
        --ansi --phony --query "$INITIAL_QUERY"
}

utilpath() {
    echo "$PACPATH/utils/$1.sh"
}

runutil() {
    UTIL="$1"
    shift 1
    bash "$PACPATH/utils/$UTIL.sh" "$@"
}

export PACPATH="/usr/share/instantpacman"

strun() {
    st -c instantfloat -e sh -c "($1 || bash) && notify-send '$2'; sleep 1"
}

runprovider() {
    strun "$PACPATH/providers/$1.sh" "$2"
}
