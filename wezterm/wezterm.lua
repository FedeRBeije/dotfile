-- pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- Theme
config.color_scheme = "Tokyo Night Moon"

-- Font
-- config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font = wezterm.font("JetBrains Mono")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- config.colors = {}

config.window_background_opacity = 0.8
config.macos_window_background_blur = 8 --12

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

-- config.background = {
-- 	{
-- 		source = {
-- 			File = wezterm.config_dir .. "/image/cb.jpg",
-- 		},
-- 		opacity = 0.3, -- Adjust the image opacity
-- 	},
-- 	{
-- 		source = {
-- 			Color = "#000000",
-- 		},
-- 		opacity = 0.5, -- Adjust the overlay opacity
-- 	},
-- }

config.window_background_gradient = {
	orientation = "Vertical",

	colors = {
		"#223343",
		"#000000",
	},

	interpolation = "Linear",

	blend = "Rgb",
}

return config
