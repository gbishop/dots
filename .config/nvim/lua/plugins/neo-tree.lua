return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local dots = require("dots")
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_added",
					handler = function(arg)
						if string.match(arg, "/home/gb/dots/*") then
							dots.sync()
						end
					end,
				},
				{
					event = "file_deleted",
					handler = function(arg)
						if string.match(arg, "/home/gb/dots/*") then
							dots.sync()
						end
					end,
				},
				{
					event = "file_moved",
					handler = function(arg)
						if string.match(arg.source, "/home/gb/dots/*") then
							dots.sync()
						end
					end,
				},
				{
					event = "file_renamed",
					handler = function(arg)
						if string.match(arg.source, "/home/gb/dots/*") then
							dots.sync()
						end
					end,
				},
			},
		})
	end,
}
