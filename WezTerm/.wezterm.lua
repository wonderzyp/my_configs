--[[
README:

CTRL + n:			new tab
CTRL + RightArrow		split horizontal
CTRL + DownArrow		split vertical

CTRL + Mouse WheelUp/Down:	change font size
CTRL + Mouse RightButton: 	copy from clipboard

Some Other Setting:
- copy on select
- not check update
- window_background_opacity = 0.8
]]--

local wezterm = require 'wezterm'

local my_shortcuts = {}
local my_mouse_bindings = {}

table.insert(my_shortcuts, {
	key = 'RightArrow',
	mods = 'CTRL',
	action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
})

table.insert(my_shortcuts, {
	key = 'DownArrow',
	mods = 'CTRL',
	action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
})

table.insert(my_shortcuts, {
	key = 'n',
	mods = 'CTRL',
	action = wezterm.action.SpawnTab 'CurrentPaneDomain',
})


table.insert(my_mouse_bindings, {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = 'CTRL',
      action = wezterm.action.IncreaseFontSize,
})

table.insert(my_mouse_bindings, {
      event = { Down = { streak = 1, button = { WheelDown = 1}  } },
      mods = 'CTRL',
      action = wezterm.action.DecreaseFontSize,
})

table.insert(my_mouse_bindings, {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = wezterm.action.PasteFrom("Clipboard"),
})


local config = {
	copy_on_select = true,
	animation_fps = 1,
	cursor_blink_ease_in = 'Constant',
	cursor_blink_ease_out = 'Constant',
	check_for_updates = false,
	font = wezterm.font 'JetBrains Mono',
	color_scheme = 'Snazzy (Gogh)',
	adjust_window_size_when_changing_font_size = false,
	default_cursor_style = 'BlinkingUnderline',
	default_prog = default_prog,
	keys = my_shortcuts,
	mouse_bindings = my_mouse_bindings,
	window_background_opacity = 0.8,
}

return config
