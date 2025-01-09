local wezterm = require 'wezterm'

local config = {}

config.initial_cols = 125
config.initial_rows = 60
config.font = wezterm.font 'JetBrains Mono'
config.window_background_opacity = 0.95
config.window_close_confirmation = 'NeverPrompt'

config.window_decorations = 'RESIZE'

config.color_scheme = 'Tokyo Night'
config.enable_scroll_bar=true
warn_about_missing_glyphs=false

local function toggle_horizontal_split(window, pane)
  -- Check if there's more than one pane in the current tab
  local tab = window:mux_window():active_tab()
  if #tab:panes() > 1 then
    -- Close the current pane
    window:perform_action(wezterm.action.CloseCurrentPane { confirm = false }, pane)
  else
    -- Split horizontally if only one pane exists
    window:perform_action(wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }, pane)
  end
end

config.keys = {
    {
        key = "`",
        mods = "CTRL",
        action = wezterm.action_callback(toggle_horizontal_split),
    }
}

-- For arrow in top bar
wezterm.on('update-status', function(window)
  -- Grab the utf8 character for the "powerline" left facing
  -- solid arrow.
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Grab the current window's configuration, and from it the
  -- palette (this is the combination of your chosen colour scheme
  -- including any overrides).
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. wezterm.hostname() .. ' ' },
  }))
end)

return config
