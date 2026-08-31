--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hyprland.org
--
-- ##############################################
-- ###               WINDOWRULES              ###
-- ##############################################

-- Inhibit idle when there's a fullscreen window
hl.window_rule({match = {class = ".*"}, idle_inhibit = "fullscreen"})

-- Random apps that I want to float
for _, app in ipairs({
    "onedriver-launcher", "org.kde.kdeconnect.handler",
    --[["org.prismlauncher.PrismLauncher",]] "xdg-desktop-portal-gtk",
    "[Ww]aydroid.*", "org.hyprland.xdg-desktop-portal-hyprland"
}) do
    hl.window_rule({match = {class = app}, float = true})
end
hl.window_rule({match = {class = "thunar.*", title = "Avanzamento delle operazione sui file"}, float = true})
hl.window_rule({match = {class = "thunar.*", title = "Rinomina di .*"}, float = true})

-- Privacy
hl.window_rule({match = {class = "Bitwarden"}, no_screen_share = true})

-- Games
for _, app in ipairs({"hollow_knight.x86_64", "hexceed", "steam_app_[0-9]*", "Minecraft.*", "ShadowOfTheTombRaider"}) do
    hl.window_rule({match = {class = app}, tile = true, immediate = true, workspace = 6})
end

-- Flameshot
hl.window_rule({
    match = {
        class = "flameshot",
        title = "flameshot"
    },

    border_size = 0,
    float = true,
    fullscreen_state = "2 0",
    max_size = "3840 1440",
    min_size = "3840 1440",
    move = "0 0",
    pin = true,
    rounding = 0,
    size = "3840 1440",
    stay_focused = true,
    suppress_event = "fullscreen"
})
hl.window_rule({match = {class = "flameshot", title = "Upload image"}, float = true})
hl.window_rule({match = {class = "flameshot", title = "Configuration"}, float = true})
hl.window_rule({match = {class = "flameshot", title = "Capture Launcher"}, float = true})
hl.window_rule({match = {class = "flameshot", title = "Save screenshot"}, float = true})

-- KDE Connect
hl.window_rule({
    match = {
        class = "org.kdeconnect.daemon"
    },

    border_size = 0,
    float = true,
    no_blur = true,
    rounding = 0,
    size = "100% 100%",
    suppress_event = "fullscreen"
})
hl.window_rule({match = {class = "org.kde.kdeconnect.daemon", title = "Ricezione file .*"}, float = true})

-- Firefox stuff
hl.window_rule({
    match = {
        class = "firefox",
        title = "(Picture-in-Picture)|(Informazioni su Mozilla Firefox)"
    },

    float = true,
    keep_aspect_ratio = true
})

-- Make some windows floating - https://wiki.hypr.land/configuring/code-snippets/#float-browsers-extension-windows
hl.on("window.open", function(w)
    if w.class ~= "firefox" then return end
    if w.initial_title ~= "Mozilla Firefox" then return end

    local ff_windows = hl.get_windows({class = "firefox"})
    if #ff_windows <= 1 then return end

    local sub
    sub = hl.on("window.title", function(tw)
        if tw.address ~= w.address then return end
        if tw.title == ""
            or tw.title == "Mozilla Firefox"
            or tw.title == "about:blank"
            or tw.title == "Informazioni su Mozilla Firefox" then
            return
        end

        sub:remove()

        if tw.title:match("^Estensione:") then
            hl.dispatch(hl.dsp.window.float({action = "set", window = tw}))
            hl.dispatch(hl.dsp.window.resize({x = 400, y = 600, window = tw}))
            hl.dispatch(hl.dsp.window.center({window = tw}))
        end
    end)
end)

-- Various authentication stuff
hl.window_rule({match = {class = "lxpolkit"}, stay_focused = true, pin = true})
hl.window_rule({match = {class = "lxpolkit", title = "Autenticazione"}, center = true, size = "548 314"})
hl.window_rule({match = {class = "lxpolkit", title = "(Informazione)|(Errore)"}, center = true})

-- Bugged telegram media viewer
hl.window_rule({
    match = {
        class = "org.telegram.desktop",
        title = "Visualizzatore multimediale"
    },

    float = true,
    fullscreen = true
})

-- IntelliJ popups
hl.window_rule({match = {class = "jetbrains-idea-ce", title = "^win(.*)"}, no_initial_focus = true})

-- LAYERRULES --

for _, app in ipairs({
    "rofi", "layout_dialog", "(waybar)|(laptop)|(ultrawide)|(regular)",
    "swaync.*", "selection", "hypr-network-manager", "vicinae"
}) do
    hl.layer_rule({match = {class = app}, blur = true, ignore_alpha = 0.2, blur_popups = true})
end
