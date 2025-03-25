MiniDeps.add({
  source = "nvim-neo-tree/neo-tree.nvim",
  depends = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
})
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
