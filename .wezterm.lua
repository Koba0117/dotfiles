local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- font
config.font_size = 16
config.font = wezterm.font("FiraCode Nerd Font")
-- config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "Noto Sans CJK JP" })

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- color
config.color_scheme = "Catppuccin Mocha"
config.colors = {
	tab_bar = {
		background = "#1e1e2e",
		active_tab = {
			bg_color = "#89b4fa",
			fg_color = "#11111b",
		},
	},
}

-- tab
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- shortcuts
config.keys = {
	{
		key = "t",
		mods = "ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
}

-- tab
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
end

config.default_prog = { "/usr/bin/fish" }

return config
