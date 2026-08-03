--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Basics/Autostart
--
-- ##############################################
-- ###               AUTOSTART                ###
-- ##############################################

hl.on("hyprland.start", function ()
    for _, cmd in ipairs({
        -- Background
        "sleep 2; SECURE_KEY_CONTAINER_BACKEND=keyctl bitwarden --autostart",
        "blueman-applet",
        "hypr-network-manager --daemon",
        "hyprctl devices | grep -q logitech && solaar -w hide -b solaar",
        "hypridle --quiet",
        "hyprlock -c ~/.config/hypr/hyprlock/hyprlogin.conf -q || hyprctl dispatch exit", -- Login Manager
        "hyprpaper",
        "hyprsunset",
        "kdeconnect-indicator",
        "hypr-kdeconnect-portal",
        "lxpolkit",
        "swaync",
        "waybar",
        "vicinae server",
        "syncthing --no-browser serve",
        "openrgb -d 0 -m direct -c 001010 -d 1 -m direct -c 001010 -d 2 -m direct -c 001010",
        -- Scripts
        "~/.config/hypr/scripts/ac_detect.sh",
        "~/.config/hypr/scripts/capslock.sh",
        "~/.config/hypr/scripts/volbright.sh --keyboard",
        -- Clipboard
        "wl-clip-persist -c both",
    }) do
        hl.exec_cmd(cmd)
    end
end)

-- Reload other configs
--[[
hl.exec_cmd("swaync-client -R")
hl.exec_cmd("swaync-client -rs")

hl.exec_cmd("killall -SIGUSR2 waybar")
]]

