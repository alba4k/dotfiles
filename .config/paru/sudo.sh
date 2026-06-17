#!/bin/sh
if [[ "$(uname -n)" = "desktop" ]]; then
    sudo $@
else
    sudo -p "Impronta digitale o password:
" $@
fi

