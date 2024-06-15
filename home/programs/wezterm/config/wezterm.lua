local wezterm = require("wezterm")
local act = wezterm.action
local function font_with_fallback(name, params)
	local font = { family = name, weight = "Regular", style = "Normal" }
	local names = { font, "CommitMono-Regular", "JetBrainsMonoNL NF" }
	return wezterm.font_with_fallback(names, params)
end

--local font_name = "CaskaydiaMono Nerd Font"
local font_name = "jetbrains mono nerd font"

return {
	-- OpenGL for GPU acceleration, Software for CPU
	-- front_end = "OpenGL",

	-- Shell integration
	default_prog = { "zsh" },
	debug_key_events = true,

	-- Appearance
	color_scheme = "Pasque (base16)", -- color_scheme = "Pasque (base16)",
	colors = {
		background = "#050505",
	},

	-- Font config
	font = wezterm.font("CaskaydiaMono Nerd Font", { weight = "Regular" }),
	font_size = 10.5,
	warn_about_missing_glyphs = false,
	line_height = 1.2,
	cell_width = 0.9,
	dpi = 96.0,

	-- Cursor style
	default_cursor_style = "BlinkingUnderline",

	-- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,
	-- Padding
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 10,
	},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = true,

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 0.9,
	--window_background_opacity = 1,
	window_close_confirmation = "NeverPrompt",
	window_frame = { active_titlebar_bg = "#45475a", font = font_with_fallback(font_name, { bold = true }) },

	-- X11
	enable_wayland = false,
	front_end = "WebGpu",
	-- Keybinds
	keys = require("keys"),
}
