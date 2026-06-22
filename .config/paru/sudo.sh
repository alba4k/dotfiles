#!/bin/sh
if [[ "$(uname -n)" = "desktop" ]]; then
    sudo $@
else
    sudo -p "[sudo] impronta digitale o password:
" $@
fi

