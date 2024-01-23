return {
	"folke/flash.nvim",
	---@type Flash.Config
	opts = {},
  -- stylua: ignore
  keys = {
    { "<cr>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "<c-f>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	lazy = false,
}
