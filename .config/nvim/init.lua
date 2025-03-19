-- configure mini deps
local function setup_deps(path_to_site)
	local mini_path = path_to_site .. "pack/deps/start/mini.nvim"
	if not vim.uv.fs_stat(mini_path) then
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
	require("mini.deps").setup({ path = { package = path_to_site } })
end
setup_deps(vim.fn.stdpath("data") .. "/site/")

-- setup mini early so leader is correct
require("setup-mini")

-- override some of the basics settings
vim.o.wrap = true
vim.o.updatetime = 250 --Decrease update time
vim.o.timeoutlen = 500 --Adjust timeout

vim.opt.shiftwidth = 2 -- Spacing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.hlsearch = false -- disable search highlight

require("keymaps")
require("theme")
require("dots")

vim.filetype.add({
	pattern = {
		["*.bake"] = "bake",
	},
})

require("setup-csvview")
require("setup-fugitive")
require("setup-gitsigns")
require("setup-incline")
require("setup-lsp")
require("setup-lualine")
require("setup-neotree")
require("setup-tbone")
require("setup-telescope")
require("setup-treesitter")
