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
    { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
    { key = "1", mods = "CTRL",       action = wezterm.action.ActivateTab(0) },
    { key = "2", mods = "CTRL",       action = wezterm.action.ActivateTab(1) },
    { key = "3", mods = "CTRL",       action = wezterm.action.ActivateTab(2) },
     -- Move focus between panes using Ctrl + Shift + H/J/K/L
    {key="h", mods="ALT", action=wezterm.action.ActivatePaneDirection("Left")},
    {key="j", mods="ALT", action=wezterm.action.ActivatePaneDirection("Down")},
    {key="k", mods="ALT", action=wezterm.action.ActivatePaneDirection("Up")},
    {key="l", mods="ALT", action=wezterm.action.ActivatePaneDirection("Right")},
    -- Split pane vertically with Ctrl + Shift + |
    {key="\\", mods="ALT", action=wezterm.action.SplitPane{
      direction="Right",
      size={Percent=50}
    }},
    -- Split pane horizontally with Ctrl + Shift + -
    {key="-", mods="ALT", action=wezterm.action.SplitPane{
      direction="Down",
      size={Percent=50}
    }},
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
