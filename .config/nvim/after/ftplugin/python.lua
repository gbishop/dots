vim.keymap.set(
  "n",
  "<leader>p",
  "Vas:w !tmux-paste-to-python -q<CR>`>/^.<cr>",
  -- function()
  --   vim.cmd("normal Vas")
  --   local lno = vim.fn.line(".")
  --   local command = string.format("w !tmux-paste-to-python -q %s", lno)
  --   vim.cmd(command)
  -- end,
  { desc = "Send chunk to python move", silent = true, remap = true }
)
vim.keymap.set(
  "v",
  "<leader>p",
  ":w !tmux-paste-to-python -q<CR>`>j",
  { desc = "Send selection to python move", silent = true, remap = true }
)
vim.keymap.set(
  "n",
  "<leader>P",
  "Vas:w !tmux-paste-to-python -q<CR>",
  { desc = "Send chunk to python stay", silent = true, remap = true }
)
