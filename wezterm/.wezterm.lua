local wezterm = require 'wezterm'

local config = {}

config.initial_cols = 125
config.initial_rows = 60
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 11
config.window_background_opacity = 0.95
config.window_close_confirmation = 'NeverPrompt'
config.audible_bell = 'Disabled'
config.warn_about_missing_glyphs = false

config.color_scheme = 'Tokyo Night'
config.enable_scroll_bar = false
warn_about_missing_glyphs = false
config.window_decorations = "RESIZE | TITLE"
config.enable_tab_bar = false

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.keys = {
    { key = "Tab", mods = "CTRL",       action = wezterm.action.DisableDefaultAssignment },
    { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment }
}

-- copy on select
config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = wezterm.action { CompleteSelectionOrOpenLinkAtMouseCursor = "Clipboard" },
    },
}

return config
