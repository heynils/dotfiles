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
config.enable_scroll_bar=false
warn_about_missing_glyphs=false

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- For arrow in top bar
wezterm.on('update-status', function(window)
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
  local color_scheme = window:effective_config().resolved_palette

  window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = color_scheme.background } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = color_scheme.background } },
    { Foreground = { Color = color_scheme.foreground
 } },
    { Text = ' ' .. wezterm.hostname() .. ' ' },
  }))
end)

return config
