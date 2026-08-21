MiniDeps.add("stevearc/overseer.nvim")
require("overseer").setup()

-- Open the task runner UI to pick any npm script
vim.keymap.set("n", "<leader>ro", "<cmd>OverseerRun<cr>", { desc = "Run Task" })
-- Toggle the background task log window
vim.keymap.set(
  "n",
  "<leader>rt",
  "<cmd>OverseerToggle<cr>",
  { desc = "Toggle Task Window" }
)
