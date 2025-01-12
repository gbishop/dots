return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "nvim-treesitter/playground", lazy = true },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"markdown",
				"html",
				"bash",
				"jsdoc",
				"css",
				"vimdoc",
				"vim",
				"typescript",
				"markdown_inline",
				"lua",
				"javascript",
				"regex",
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<M-w>",
					node_incremental = "<M-w>",
					scope_incremental = "<M-e>",
					node_decremental = "<M-C-w>",
				},
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"python",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		})
	end,
}
