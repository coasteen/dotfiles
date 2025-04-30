local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback {
    "JetBrainsMono Nerd Font",
    "FiraCode Nerd Font",
    "Symbols Nerd Font Mono",
    "Noto Color Emoji",
  },

 font_size = 10.0,

  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  enable_tab_bar = false,
  exit_behavior = "Close", 

  window_close_confirmation = "NeverPrompt",

  keys = {
    {
      key = "s",
      mods = "SUPER",
      action = wezterm.action.QuitApplication
    }
  },

  window_background_opacity = 0.9,
  
  colors = {
    foreground = "#d4be98",
    background = "#32302f", -- gruvbox dark soft
    cursor_bg = "#d4be98",
    cursor_border = "#d4be98",
    cursor_fg = "#282828",
    selection_bg = "#d79921",
    selection_fg = "#282828",

    ansi = { "#32302f", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
    brights = { "#5a524c", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#fbf1c7" },
  },
}

