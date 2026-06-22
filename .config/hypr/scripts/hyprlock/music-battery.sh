#!/bin/sh

if [[ "$(uname -n)" = "desktop" ]]; then
    playerctl=$(playerctl -a status 2>/dev/null)
    if echo "$playerctl" | grep -q Playing; then
        playerctl -p "spotify,*" metadata --format "󰎆  {{title}} - {{artist}}" 2>/dev/null | python -c "import html; print(html.escape(input()))" ||
            playerctl metadata --format "󰎆  {{title}} - {{artist}}" | python -c "import html; print(html.escape(input()))"
    else
        echo -n "󰝛  Niente in riproduzione"
    fi
    exit
fi

upower=$(upower -i $(upower -e | grep BAT))

bat=$(grep percentage <<< $upower | awk "{print \$2}" | sed -e "s/%//")

if ! grep "discharging" <<< $upower >/dev/null; then
    echo -n "󱐋"
fi

if ((bat >= 90)); then
    echo -n " "
elif ((bat >= 70)); then
    echo -n " "
elif ((bat >= 35)); then
    echo -n " "
elif ((bat >= 20)); then
    echo -n " "
else
    echo -n " "
fi

echo "  $bat%"

