#!/usr/bin/env bash

function cd ()
{
    applyMethodToAliasesFiles "$(pwd)" destroyAlias
    command cd "$@" || return
    applyMethodToAliasesFiles "$(pwd)" createAlias
}

function applyMethodToAliasesFiles ()
{
    if [ -f "$1/.aliases" ]; then
        processAliasesFile "$1/.aliases" "$2"
    fi

    if [ "$1" != "/" ]; then
        applyMethodToAliasesFiles "$(dirname "$1")" "$2"
    fi
}

function processAliasesFile ()
{
    while read -r line; do
        aliasName=$(echo "$line" | cut -d' ' -f1)
        aliasContent=$(echo "$line" | cut -d' ' -f2-)

        "$2" "$aliasName" "$aliasContent"
    done < "$1"
}

function destroyAlias ()
{
    alias "$1" 2> /dev/null > /dev/null && unalias "$1"
}

function createAlias ()
{
    alias "$1"="$2"
}

# This is run with ~/bashrc (i.e. at shell startup). Create any alias in the starting folder
applyMethodToAliasesFiles "$(pwd)" createAlias
