return {
	"echasnovski/mini.nvim",
	dependencies = { "windwp/nvim-autopairs" },
	config = function()
		-- require("mini.jump2d").setup({})
		require("mini.align").setup({})
		require("mini.indentscope").setup({})
		require("mini.bracketed").setup({})
		require("mini.colors").setup({})

		require("mini.completion").setup({
			delay = {
				completion = 10 ^ 7,
				info = 100,
				signature = 100,
			},
			lsp_completion = {
				source_func = "omnifunc",
				auto_setup = false,
			},
			set_vim_settings = true,
		})

		-- Set completeopt to have a better completion experience
		-- vim.o.completeopt = "menu,menuone,preview,noselect"

		-- get pairs to handoff CR
		local pairs = require("nvim-autopairs")

		local function has_words_before()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0
				and vim.api
						.nvim_buf_get_lines(0, line - 1, line, true)[1]
						:sub(col, col)
						:match("%s")
					== nil
		end

		-- trigger completion with tab
		vim.keymap.set("i", "<Tab>", function()
			if vim.fn.pumvisible() ~= 0 then
				return "<C-n>"
			elseif has_words_before() then
				return "<C-Space>"
			else
				return "<Tab>"
			end
		end, {
			expr = true,
			remap = true,
			desc = "Tab/Complete/Next",
		})

		-- goto previous with S-Tab
		vim.keymap.set("i", "<S-Tab>", function()
			if vim.fn.pumvisible() ~= 0 then
				return "<C-p>"
			else
				return "<S-Tab>"
			end
		end, {
			expr = true,
			remap = false,
			desc = "S-Tab/Previous",
		})
	end,
}
