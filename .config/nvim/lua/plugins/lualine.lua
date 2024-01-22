return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_c = { { "filename", file_status = true, path = 1 } },
				lualine_x = { "filetype" },
			},
		})
	end,
}
