local wezterm = require("wezterm")
local act = wezterm.action
local function font_with_fallback(name, params)
	local font = { family = name, weight = "Regular", style = "Normal" }
	local names = { font, "CommitMono-Regular", "JetBrainsMonoNL NF" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "CaskaydiaMono Nerd Font"

return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",

	-- Shell integration
	default_prog = { "zsh" },

	-- Appearance
	--color_scheme = "Rosé Pine Dawn (base16)",
	--color_scheme = "Purple",
	color_scheme = "Pasque (base16)",

	colors = {
		--background = "#141414",
		background = "#121212",
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

	-- Keybinds
	disable_default_key_bindings = true,
	keys = {
		{
			key = [[\]],
			mods = "CTRL|ALT",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = [[\]],
			mods = "CTRL",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "q",
			mods = "CTRL",
			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
		},
		{ -- browser-like bindings for tabbing
			key = "t",
			mods = "CTRL",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action({ ActivateTabRelative = 1 }),
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivateTabRelative = -1 }),
		}, -- standard copy/paste bindings
		{
			key = "x",
			mods = "CTRL",
			action = "ActivateCopyMode",
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		},
		--TMUX
		{ key = "1", mods = "ALT", action = act.SendString("\x021") },
		{ key = "2", mods = "ALT", action = act.SendString("\x022") },
		{ key = "3", mods = "ALT", action = act.SendString("\x023") },
		{ key = "4", mods = "ALT", action = act.SendString("\x024") },
		{ key = "5", mods = "ALT", action = act.SendString("\x025") },
		{ key = "6", mods = "ALT", action = act.SendString("\x026") },
		{ key = "7", mods = "ALT", action = act.SendString("\x027") },
		{ key = "8", mods = "ALT", action = act.SendString("\x028") },
		{ key = "9", mods = "ALT", action = act.SendString("\x029") },
		{ key = "0", mods = "ALT", action = act.SendString("\x020") },

		{ key = "t", mods = "ALT", action = act.SendString("\x02t") },
		{ key = "w", mods = "ALT", action = act.SendString("\x02w") },
		{ key = "e", mods = "ALT", action = act.SendString("\x02%") },
		{ key = "e", mods = "ALT|SHIFT", action = act.SendString('\x02"') },
		{ key = "LeftArrow", mods = "ALT|SHIFT", action = act.SendString("\x02l") },
		{ key = "RightArrow", mods = "ALT|SHIFT", action = act.SendString("\x02h") },
		{ key = "UpArrow", mods = "ALT|SHIFT", action = act.SendString("\x02k") },
		{ key = "DownArrow", mods = "ALT|SHIFT", action = act.SendString("\x02j") },
	},
}
