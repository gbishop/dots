vim.keymap.set(
  "n",
  "<leader>p",
  "Vas:w !tmux-paste-to-python<CR>`>/^.<cr>",
  { desc = "Send chunk to python move", silent = true, remap = true }
)
vim.keymap.set(
  "v",
  "<leader>p",
  ":w !tmux-paste-to-python<CR>`>j",
  { desc = "Send selection to python move", silent = true, remap = true }
)
vim.keymap.set(
  "n",
  "<leader>P",
  "Vas:w !tmux-paste-to-python<CR>",
  { desc = "Send chunk to python stay", silent = true, remap = true }
)
