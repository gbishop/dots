return {
	"declancm/cinnamon.nvim",
	config = function()
		require("cinnamon").setup({
			default_keymaps = true,
		})
	end,
}
