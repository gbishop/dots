MiniDeps.add("tpope/vim-tbone")
vim.keymap.set(
  "n",
  "<leader>p",
  "vap:Twrite right<CR>}",
  { desc = "Send chunk to python", silent = true }
)
vim.keymap.set(
  "n",
  "<leader>P",
  "vap:Twrite right<CR>",
  { desc = "Send chunk to python,stay", silent = true }
)
