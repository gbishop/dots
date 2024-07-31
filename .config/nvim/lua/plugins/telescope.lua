return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"benfowler/telescope-luasnip.nvim",
		{
			"isak102/telescope-git-file-history.nvim",
			dependencies = { "tpope/vim-fugitive" },
		},
	},
	config = function()
		local ts = require("telescope")
		ts.setup({
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
				file_ignore_patterns = { "dist" },
			},
			extensions = {
				file_browser = {
					theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						["i"] = {
							-- your custom insert mode mappings
						},
						["n"] = {
							-- your custom normal mode mappings
						},
					},
				},
			},
		})

		ts.load_extension("file_browser")
		ts.load_extension("luasnip")
		ts.load_extension("git_file_history")

		--Add keymaps
		local tb = require("telescope.builtin")

		vim.keymap.set("n", "<leader><space>", function()
			tb.buffers({ sort_mru = true, ignore_current_buffer = true })
		end, { desc = "buffers" })
		vim.keymap.set(
			"n",
			"<leader>sb",
			tb.current_buffer_fuzzy_find,
			{ desc = "fuzzy buffers" }
		)
		vim.keymap.set("n", "<leader>sc", tb.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>sd", tb.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>sf", tb.find_files, { desc = "files" })
		vim.keymap.set("n", "<leader>sg", tb.live_grep, { desc = "live grep" })
		vim.keymap.set("n", "<leader>sh", tb.help_tags, { desc = "help tags" })
		vim.keymap.set("n", "<leader>sk", tb.keymaps, { desc = "Key Maps" })
		vim.keymap.set("n", "<leader>sr", tb.lsp_references, { desc = "lsp references" })
		vim.keymap.set("n", "<leader>ss", function()
			vim.cmd([[ Telescope luasnip ]])
		end, { desc = "snippets" })
		vim.keymap.set("n", "<leader>st", tb.tags, { desc = "tags" })
		vim.keymap.set("n", "<leader>sT", function()
			tb.tags({ only_current_buffer = true })
		end, { desc = "tags current" })
		vim.keymap.set("n", "<leader>?", tb.oldfiles, { desc = "old files" })
	end,
}
