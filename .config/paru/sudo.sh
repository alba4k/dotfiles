#!/bin/sh
if [[ "$hostname" = "desktop" ]]; then
    sudo $@
else
    sudo -p "Impronta digitale o password:
" $@
fi

