MiniDeps.add("mrjones2014/smart-splits.nvim")
local SS = require("smart-splits")
SS.setup({})
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", SS.resize_left)
vim.keymap.set("n", "<A-j>", SS.resize_down)
vim.keymap.set("n", "<A-k>", SS.resize_up)
vim.keymap.set("n", "<A-l>", SS.resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", SS.move_cursor_left)
vim.keymap.set("n", "<C-j>", SS.move_cursor_down)
vim.keymap.set("n", "<C-k>", SS.move_cursor_up)
vim.keymap.set("n", "<C-l>", SS.move_cursor_right)
