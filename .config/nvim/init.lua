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

require("options")
require("keymaps")
require("theme")
require("dots")

vim.filetype.add({
	pattern = {
		["*.bake"] = "bake",
	},
})

require("setup-mini")
require("setup-telescope")
require("setup-lsp")
require("setup-csvview")
require("setup-treesitter")
require("setup-fugitive")
MiniDeps.add("hat0uma/csvview.nvim")
require("csvview").setup()
require("setup-tbone")
require("setup-gitsigns")
require("setup-incline")
require("setup-lualine")
require("setup-neotree")
-- vim: ts=2 sts=2 sw=2 et
