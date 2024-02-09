return {
	"folke/flash.nvim",
	---@type Flash.Config
	opts = {},
  -- stylua: ignore
  keys = {
    { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<c-f>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	lazy = false,
}
