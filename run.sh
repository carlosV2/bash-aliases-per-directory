#!/bin/sh

function cd ()
{
    applyMethodToAliasesFiles `pwd` destroyAlias
    command cd "$@"
    applyMethodToAliasesFiles `pwd` createAlias
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
    while read line; do
        aliasName=`echo "$line" | cut -d' ' -f1`
        aliasContent=`echo "$line" | cut -d' ' -f2-`

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

UPDATE_PATH=`dirname ${BASH_SOURCE}`
$(cd ${UPDATE_PATH}; git submodule update --init)
source "${UPDATE_PATH}/lib/update/update.sh"