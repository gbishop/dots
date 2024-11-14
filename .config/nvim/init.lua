--Remap space as leader key
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup({ path = { package = path_package } })
local add = MiniDeps.add

require("options")

require("keymaps")

require("themes")

require("dots")

vim.filetype.add({
	pattern = {
		["*.bake"] = "bake",
	},
})

add({
	source = "Vonr/align.nvim",
})
local NS = { noremap = true, silent = true }
vim.keymap.set("x", "aa", function()
	require("align").align_to_char(1, true)
end, NS) -- Aligns to 1 character, looking left
vim.keymap.set("x", "as", function()
	require("align").align_to_char(2, true, true)
end, NS) -- Aligns to 2 characters, looking left and with previews
vim.keymap.set("x", "aw", function()
	require("align").align_to_string(false, true, true)
end, NS) -- Aligns to a string, looking left and with previews
vim.keymap.set("x", "ar", function()
	require("align").align_to_string(true, true, true)
end, NS) -- Aligns to a Lua pattern, looking left and with previews

add({
	source = "windwp/nvim-autopairs",
})
require("nvim-autopairs").setup()

add({
	source = "numToStr/Comment.nvim",
})
require("Comment").setup()

require("git-helpers")
