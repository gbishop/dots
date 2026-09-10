MiniDeps.add("mrjones2014/smart-splits.nvim")

local ss = require("smart-splits")
ss.setup({
  multiplexer_integration = "wezterm",
})

-- Keymaps to move seamlessly between Neovim splits and WezTerm panes
vim.keymap.set("n", "<C-h>", ss.move_cursor_left)
vim.keymap.set("n", "<C-j>", ss.move_cursor_down)
vim.keymap.set("n", "<C-k>", ss.move_cursor_up)
vim.keymap.set("n", "<C-l>", ss.move_cursor_right)

-- Resizing
vim.keymap.set("n", "<A-h>", ss.resize_left)
vim.keymap.set("n", "<A-j>", ss.resize_down)
vim.keymap.set("n", "<A-k>", ss.resize_up)
vim.keymap.set("n", "<A-l>", ss.resize_right)
