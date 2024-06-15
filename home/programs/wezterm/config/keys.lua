local wezterm = require("wezterm")
local wa = wezterm.action

wezterm.on("padding-off", function(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_padding then
		overrides.window_padding = {
			top = "0",
			right = "0",
			bottom = "0",
			left = "0",
		}
	else
		overrides.window_padding = nil
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("toggle-opacity", function(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.7
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("toggle-darkmode", function(window)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == "Ashes (light) (terminal.sexy)" then
		overrides.color_scheme = "Pasque (base16)"
	else
		overrides.color_scheme = "Ashes (light) (terminal.sexy)"
	end
	window:set_config_overrides(overrides)
end)

return {
	{ key = "p", mods = "CTRL", action = wa.EmitEvent("padding-off") },
	{ key = "o", mods = "CTRL", action = wa.EmitEvent("toggle-opacity") },
	{ key = "i", mods = "CTRL", action = wa.EmitEvent("toggle-darkmode") },
	{ key = "v", mods = "CTRL|SHIFT", action = wa.PasteFrom("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = wa.PasteFrom("PrimarySelection") },
	{ key = "V", mods = "CTRL|SHIFT", action = wa.PasteFrom("Clipboard") },
	{ key = "V", mods = "CTRL|SHIFT", action = wa.PasteFrom("PrimarySelection") },
	--TMUX
	{ key = "1", mods = "ALT", action = wa.SendString("\x021") },
	{ key = "2", mods = "ALT", action = wa.SendString("\x022") },
	{ key = "3", mods = "ALT", action = wa.SendString("\x023") },
	{ key = "4", mods = "ALT", action = wa.SendString("\x024") },
	{ key = "5", mods = "ALT", action = wa.SendString("\x025") },
	{ key = "6", mods = "ALT", action = wa.SendString("\x026") },
	{ key = "7", mods = "ALT", action = wa.SendString("\x027") },
	{ key = "8", mods = "ALT", action = wa.SendString("\x028") },
	{ key = "9", mods = "ALT", action = wa.SendString("\x029") },
	{ key = "0", mods = "ALT", action = wa.SendString("\x020") },

	{ key = "t", mods = "ALT", action = wa.SendString("\x02t") },
	{ key = "w", mods = "ALT", action = wa.SendString("\x02w") },
	{ key = "e", mods = "ALT", action = wa.SendString("\x02%") },
	{ key = "e", mods = "ALT|SHIFT", action = wa.SendString('\x02"') },
	{ key = "LeftArrow", mods = "ALT|SHIFT", action = wa.SendString("\x02l") },
	{ key = "RightArrow", mods = "ALT|SHIFT", action = wa.SendString("\x02h") },
	{ key = "UpArrow", mods = "ALT|SHIFT", action = wa.SendString("\x02k") },
	{ key = "DownArrow", mods = "ALT|SHIFT", action = wa.SendString("\x02j") },
}
