--[[
Themes I've tried:

--]]
return {
	-- "rebelot/kanagawa.nvim",
	-- "EdenEast/nightfox.nvim",
	-- "Iron-E/nvim-highlite",
	-- "folke/tokyonight.nvim",
	-- "slugbyte/lackluster.nvim",
	"https://gitlab.com/bartekjaszczak/finale-nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
		},
	},
	{ "uloco/bluloco.nvim", dependencies = { "rktjmp/lush.nvim" } },
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			contrast = "hard",
		},
	},
	{
		"ramojus/mellifluous.nvim",
		opts = {
			mellifluous = {
				bg_contrast = "hard",
			},
		},
	},
}
