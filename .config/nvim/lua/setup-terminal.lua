MiniDeps.add("rebelot/terminal.nvim")
require("terminal").setup()

local term_map = require("terminal.mappings")
vim.keymap.set({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true })
vim.keymap.set("n", "<leader>to", term_map.toggle)
vim.keymap.set("n", "<leader>tO", term_map.toggle({ open_cmd = "enew" }))
vim.keymap.set("n", "<leader>tr", term_map.run)
vim.keymap.set("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }))
vim.keymap.set("n", "<leader>tk", term_map.kill)
vim.keymap.set("n", "<leader>t]", term_map.cycle_next)
vim.keymap.set("n", "<leader>t[", term_map.cycle_prev)
vim.keymap.set("n", "<leader>tl", term_map.move({ open_cmd = "belowright vnew" }))
vim.keymap.set("n", "<leader>tL", term_map.move({ open_cmd = "botright vnew" }))
vim.keymap.set("n", "<leader>th", term_map.move({ open_cmd = "belowright new" }))
vim.keymap.set("n", "<leader>tH", term_map.move({ open_cmd = "botright new" }))
vim.keymap.set("n", "<leader>tf", term_map.move({ open_cmd = "float" }))

vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l")

-- start in input mode
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    if vim.bo.buftype == "terminal" then
      -- Execute the startinsert command.  Starts insert mode.
      vim.cmd.startinsert()
    end
  end,
})

local ipython = require("terminal").terminal:new({
  layout = { open_cmd = "botright vertical new" },
  cmd = { "ipython" },
  autoclose = true,
})

vim.api.nvim_create_user_command("IPython", function()
  ipython:toggle(nil, true)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.keymap.set("x", "<leader>ts", function()
    vim.api.nvim_feedkeys('"+y', "n", false)
    ipython:send("%paste")
  end, { buffer = bufnr })
  vim.keymap.set("n", "<leader>t?", function()
    ipython:send(vim.fn.expand("<cexpr>") .. "?")
  end, { buffer = bufnr })
end, {})
