vim.keymap.set(
  "n",
  "<leader>p",
  "Vasgy`>j:silent !tmux-paste-to-python<CR>",
  { desc = "Send chunk to python move", silent = true, remap = true }
)
vim.keymap.set(
  "v",
  "<leader>p",
  "gy`>j:silent !tmux-paste-to-python<CR>",
  { desc = "Send selection to python move", silent = true, remap = true }
)
vim.keymap.set(
  "n",
  "<leader>P",
  "Vasgy:silent !tmux-paste-to-python<CR>",
  { desc = "Send chunk to python stay", silent = true, remap = true }
)
