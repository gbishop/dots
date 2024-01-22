return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		{ "rafamadriz/friendly-snippets" },
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load({
			paths = { "./snippets/javascript" },
		})
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

		local ls = require("luasnip")
		-- local types = require("luasnip.util.types")

		ls.config.set_config({
			history = false,
			store_selection_keys = "<C-x>",
		})

		-- keymaps
		vim.keymap.set({ "i", "s" }, "<C-c>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { desc = "luasnip choose" })

		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if ls.expand_or_locally_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true, desc = "luasnip next" })

		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true, desc = "luasnip previous" })

		-- allow jsdoc casting in one step
		vim.cmd("xmap @c <C-x>@c<C-k>")
	end,
}
