local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- Read active theme from persistent state file
local function get_theme()
	local path = wezterm.config_dir .. "/theme.txt"
	local file = io.open(path, "r")
	if file then
		local scheme = file:read("*l")
		file:close()
		if scheme and #scheme > 0 then
			return scheme
		end
	end
	return "Tokyo Night" -- Fallback scheme if file is missing
end

config.color_scheme = get_theme()
config.font_size = 14.0
config.hide_tab_bar_if_only_one_tab = true

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

local function is_vim(pane)
	local info = pane:get_foreground_process_info()
	if not info then
		return false
	end
	local name = info.name:lower()
	return name == "nvim" or name == "vim"
end

local function direction_keys(key, direction)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				win:perform_action(act.SendKey({ key = key, mods = "CTRL" }), pane)
			else
				win:perform_action(act.ActivatePaneDirection(direction), pane)
			end
		end),
	}
end

local function resize_keys(key, direction)
	return {
		key = key,
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				win:perform_action(act.SendKey({ key = key, mods = "ALT" }), pane)
			else
				win:perform_action(act.AdjustPaneSize({ direction, 3 }), pane)
			end
		end),
	}
end

config.keys = {
	-- Smart Navigation (<Ctrl> + h/j/k/l)
	direction_keys("h", "Left"),
	direction_keys("j", "Down"),
	direction_keys("k", "Up"),
	direction_keys("l", "Right"),

	-- Smart Resizing (<Alt> + h/j/k/l)
	resize_keys("h", "Left"),
	resize_keys("j", "Down"),
	resize_keys("k", "Up"),
	resize_keys("l", "Right"),

	-- Pane Splitting (<Leader> + s or v)
	{
		key = "s",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Pane Utility Controls
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

	{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
}

return config
