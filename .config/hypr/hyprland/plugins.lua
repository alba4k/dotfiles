--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Plugins/Using-Plugins
--
-- ##############################################
-- ###                PLUGINS                 ###
-- ##############################################

-- Loading them may help lol
hl.on("hyprland.start", function ()
    hl.exec_cmd("hyprpm reload")
end)


local enabled = {
    ["dynamic-cursors"] = false,
    ["hymission"] = false,
    ["Hypr-DarkWindow"] = false,
    ["hypr-kinetic-scroll"] = false,
    ["Hyprspace"] = false
}

for _, plugin in ipairs(hl.get_loaded_plugins()) do
    if enabled[plugin.name] ~= nil then
        enabled[plugin.name] = true
    end
end

-- https://github.com/VirtCode/hypr-dynamic-cursors
if enabled["dynamic-cursors"] then
    hl.config({
        plugin = {
            dynamic_cursors = {
                mode = "stretch", -- "none" to disable

                shake = {
                    threshold = 5.0,
                    base = 3.0,
                    speed = 2.0,
                    timeout = 1000,
                    effects = false,
                    ipc = false
                },

                hyprcursor = {
                    enabled = true,
                    nearest = 0
                },

                stretch = {
                    limit = 3000,
                    activation = "linear",
                    window = 100
                }
            }
        }
    })
end

-- https://github.com/gfhdhytghd/hymission
if enabled["hymission"] then
    hl.bind("SUPER + W", hl.plugin.hymission.toggle)
    hl.bind("SUPER + SHIFT + W", function() hl.plugin.hymission.toggle("onlycurrentworkspace") end)

    hl.plugin.hymission.gesture({
        fingers = 3,
        direction = "vertical",
        action = "toggle",
        args = "onlycurrentworkspace",
    })
    hl.plugin.hymission.gesture({
        fingers = 3,
        direction = "vertical",
        action = "toggle",
        recommand = true,
    })

    hl.config({
        plugin = {
            hymission = {
                layout_engine = "apple",
                switch_release_key = "Super_L",
                workspace_strip_anchor = "left",
                show_focus_indicator = 0,

                workspace_strip_thickness = 320,
                workspace_strip_gap = 0,
                expand_selected_window = 1,
                hover_expand_scale = 1.1,

                workspace_strip_background_color = "rgba(31324400)",
                workspace_strip_inactive_color = "rgba(313244ff)",
                workspace_strip_active_color = "rgba(313244ff)",
                workspace_strip_empty_color = "rgba(00000000)",
                workspace_strip_new_color = "rgba(45475a55)",
                workspace_strip_hover_tint_color = "rgba(cba6f755)",
                workspace_strip_active_tint_color = "rgba(cba6f722)",
                workspace_strip_inactive_tint_color = "rgba(00000000)",
                workspace_strip_plus_color = "rgba(cba6f7ff)",
            },
        },
    })
end

-- https://github.com/micha4w/Hypr-DarkWindow
if enabled["Hypr-DarkWindow"] then
    hl.bind("SUPER + I", hl.plugin.darkwindow.dsp_shade({shader = "invert"}))

    hl.window_rule({
        match = {
            class = "rquickshare"
        },
        ["darkwindow:shade"] = "invert"
    })
    
    hl.config({["plugin.darkwindow.load_shaders"] = "invert"})
end

-- https://github.com/savonovv/hypr-kinetic-scroll
if enabled["hypr-kinetic-scroll"] then
    hl.plugin.kinetic_scroll.disable_default()
    hl.plugin.kinetic_scroll.enable("dev.zed.Zed")
    hl.plugin.kinetic_scroll.enable("code")
    hl.plugin.kinetic_scroll.enable("steam")

    hl.config({
        plugin = {
            kinetic_scroll = {
                decel = 0.95,
                min_velocity = 0.1,
                delta_multiplier = 1.25,
                stop_on_click = true
            }
        }
    })
end

-- https://github.com/KZDKM/Hyprspace
if enabled["Hyprspace"] then
    hl.config({
        plugin = {
            overview = {
                panelHeight = 200,
                workspaceMargin = 15,
                onBottom = true,
                panelBorderWidth = 1,
                workspaceBorderSize = 3,
                dragAlpha = 0.7,
                panelBorderColor = C_PRIMARY,
                workspaceActiveBorder = C_PRIMARY,
                disableGestures = false,

                autoScroll = false,
                exitOnClick = false,
                switchOnDrop = true,
                exitOnSwitch = false,

                affectStrut = false,
                overrideGaps = false,
                showNewWorkspace = true,
                showEmptyWorkspace = false,
                showSpecialWorkspace = false,

                hideBackgroundLayers = false,
                hideTopLayers = false,
                hideOverlayLayers = false,
            }
        }
    })

    if enabled["hymission"] then
        hl.config({["plugin.overview.disableGestures"] = true})
    else
        hl.plugin.hymission.toggle("reverse")
    end
end

