--[[
Attempt to use the neovim terminal

TODO:

  get an ipython repl working in terminal

  something like ^A-z in tmux using tabs in neovim. The goal is easily getting
  back to a side-by-side layout after focusing on a buffer.

--]]

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "leave terminal mode" })

vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h", { desc = "window left" })
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j", { desc = "window down" })
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k", { desc = "window up" })
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l", { desc = "window right" })

-- do I need these?
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vertical terminal")
end, { desc = "Open a terminal in a vertical split" })
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("horizontal terminal")
end, { desc = "Open a terminal in a horizontal split" })

local group = vim.api.nvim_create_augroup("custom-term-open", { clear = true })
-- start in input mode
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  desc = "set terminal to insert mode when entering",
  group = group,
  callback = function()
    -- using schedule appears to be required when coming from telescope
    if vim.bo.buftype == "terminal" then
      vim.schedule(function()
        -- check again
        if vim.bo.buftype == "terminal" then
          vim.cmd.startinsert()
          vim.notify("insert")
        end
      end)
    end
  end,
})

vim.api.nvim_create_autocmd({ "TermRequest" }, {
  desc = "Handles OSC 7 dir change requests",
  group = group,
  callback = function(ev)
    if string.sub(ev.data.sequence, 1, 4) == "\x1b]7;" then
      local dir = string.gsub(ev.data.sequence, "\x1b]7;file://[^/]*", "")
      if vim.fn.isdirectory(dir) == 0 then
        vim.notify("invalid dir: " .. dir)
        return
      end
      vim.api.nvim_buf_set_var(ev.buf, "osc7_dir", dir)
      if vim.o.autochdir and vim.api.nvim_get_current_buf() == ev.buf then
        vim.cmd.cd(dir)
      end
    end
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "DirChanged" }, {
  desc = "Keep the dir synced",
  group = group,
  callback = function(ev)
    if vim.b.osc7_dir and vim.fn.isdirectory(vim.b.osc7_dir) == 1 then
      vim.cmd.cd(vim.b.osc7_dir)
    end
  end,
})

MiniDeps.add("milanglacier/yarepl.nvim")
require("yarepl").setup()

vim.keymap.set("x", "<C-P>", "<Plug>(REPLSendVisual)")

-- MiniDeps.add("rebelot/terminal.nvim")
-- require("terminal").setup()
--
-- local ipython = require("terminal").terminal:new({
--   layout = { open_cmd = "botright vertical new" },
--   cmd = { "ipython" },
--   autoclose = true,
-- })
--
-- local send_visual_text = function(bufnr)
--   local vstart = vim.fn.getpos("'<")
--   local vend = vim.fn.getpos("'>")
--   local line_start = vstart[2] - 1
--   local line_end = vend[2]
--   local lines = vim.api.nvim_buf_get_lines(bufnr, line_start, line_end, false)
--   local start_seq = "\x1b[200~"
--   local end_seq = "\x1b[201~"
--   ipython:send(start_seq .. unpack(lines) .. end_seq)
-- end
--
-- vim.api.nvim_create_user_command("IPython", function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   ipython:toggle(nil, true)
--   vim.notify("ipython")
--   vim.keymap.set("x", "<c-p>", function()
--     vim.notify("paste")
--     send_visual_text(bufnr)
--   end, { buffer = bufnr })
--   vim.keymap.set("n", "<leader>t?", function()
--     ipython:send(vim.fn.expand("<cexpr>") .. "?")
--   end, { buffer = bufnr })
-- end, {})
