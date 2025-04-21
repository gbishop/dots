--[[
Attempt to use the neovim terminal

TODO:

  edit commands in bash or maybe better make it easy to create commands in
  a scratch buffer and ship them to bash

  get an ipython repl working in terminal

  something like ^A-z in tmux using tabs in neovim. The goal is easily getting
  back to a side-by-side layout after focusing on a buffer.

--]]

vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l")

vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vertical terminal")
end, { desc = "Open a terminal in a vertical split" })

vim.keymap.set("n", "<leader>th", function()
  vim.cmd("horizontal terminal")
end, { desc = "Open a terminal in a horizontal split" })

-- start in input mode
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "set terminal to insert mode when entering",
  pattern = "term://*",
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    -- using schedule appears to be required when coming from telescope
    vim.schedule(vim.cmd.startinsert)
  end,
})

-- local ipython = require("terminal").terminal:new({
--   layout = { open_cmd = "botright vertical new" },
--   cmd = { "ipython" },
--   autoclose = true,
-- })
--
-- vim.api.nvim_create_user_command("IPython", function()
--   ipython:toggle(nil, true)
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.keymap.set("x", "<leader>ts", function()
--     vim.api.nvim_feedkeys('"+y', "n", false)
--     ipython:send("%paste")
--   end, { buffer = bufnr })
--   vim.keymap.set("n", "<leader>t?", function()
--     ipython:send(vim.fn.expand("<cexpr>") .. "?")
--   end, { buffer = bufnr })
-- end, {})
