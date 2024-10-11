local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Aura (Gogh)'
config.window_background_opacity = 0.9

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 14
config.initial_cols = 96
config.initial_rows = 32

local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
local background = wezterm.color.parse(scheme.background)
local foreground = wezterm.color.parse(scheme.foreground)

config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
    active_titlebar_bg = background,
    inactive_titlebar_bg = background,
}
config.colors = {
    tab_bar = {
        inactive_tab_edge = background,
    },
}

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane

    if tab.is_active then
        return {
            { Background = { Color = background:lighten(0.2) } },
            { Foreground = { Color = foreground } },
            { Text = tab.tab_index .. ": " .. pane.title }
        }
    else
        return {
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = tab.tab_index .. ": " .. pane.title }
        }
    end
end)

return config
