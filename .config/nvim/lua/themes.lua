-- theme setup
--
local add = MiniDeps.add

add({
	source = "https://gitlab.com/bartekjaszczak/finale-nvim",
})
add({
	source = "nvim-lua/plenary.nvim",
})

vim.o.background = "dark"

-- vim.cmd("colorscheme mellifluous")
vim.cmd("colorscheme finale")
-- adjust the cursor line highlight
-- vim.cmd("hi CursorLine guibg=#303030")
vim.cmd("set cursorline")

--
--[[
This code has three goals.
  1. Keep the NVIM and TMUX colors synchronized.
  2. Dull the background on inactive windows and splits.
  3. Automatically generate the dim color.
--]]

-- move the color c toward grey by factor p (0 to 1)
local function dull(c, p)
	local result = 0
	local scale = 1
	while c > 0 do
		local byte = c % 256
		c = math.floor(c / 256)
		byte = math.floor((1 - p) * byte + p * 128)
		result = result + byte * scale
		scale = scale * 256
	end
	return result
end

-- adjust colors when the theme changes
local function adjustColors()
	local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
	local activeBG = normal.bg or 0
	local inactiveBG = dull(activeBG, 0.15)
	local activeFG = normal.fg

	vim.cmd(string.format("hi ActiveWindow guibg=#%x", activeBG))
	vim.cmd(string.format("hi InactiveWindow guibg=#%x", inactiveBG))
	vim.cmd([[set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow]])

	-- adjust TMUX colors
	local Job = require("plenary.job")
	Job:new({
		command = "tmux",
		args = {
			"set",
			"-g",
			"window-active-style",
			string.format("fg=#%x bg=#%x", activeFG, activeBG),
			";",
			"set",
			"-g",
			"window-style",
			string.format("fg=#%x bg=#%x", activeFG, inactiveBG),
			";",
			"set",
			"-g",
			"pane-border-style",
			string.format("fg=#%x bg=#%x", activeFG, inactiveBG),
			";",
			"set",
			"-g",
			"pane-active-border-style",
			string.format("fg=#%x bg=#%x", activeFG, inactiveBG),
		},
	}):sync()

	-- dull when NVIM loses focus
	local agroup = vim.api.nvim_create_augroup("agroup", { clear = true })
	vim.api.nvim_create_autocmd("FocusLost", {
		command = string.format("hi ActiveWindow guibg=#%x", inactiveBG),
		group = agroup,
	})
	vim.api.nvim_create_autocmd("FocusGained", {
		command = string.format("hi ActiveWindow guibg=#%x", activeBG),
		group = agroup,
	})
	-- trigger all this when the colorscheme is changed
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = adjustColors,
		group = agroup,
	})
end

-- trigger once to get things started
adjustColors()
