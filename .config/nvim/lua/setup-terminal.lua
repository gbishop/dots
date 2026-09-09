local map = vim.keymap.set

-- 1. Directional Split Navigation (Alt + h/j/k/l)
-- Works seamlessly in both Normal mode and inside an active Terminal prompt
map({ "n", "t" }, "<A-h>", "<cmd>wincmd h<CR>")
map({ "n", "t" }, "<A-j>", "<cmd>wincmd j<CR>")
map({ "n", "t" }, "<A-k>", "<cmd>wincmd k<CR>")
map({ "n", "t" }, "<A-l>", "<cmd>wincmd l<CR>")

-- 2. Tmux-Style Tab Jumping (Alt + 1..9)
-- Jump directly to Neovim tabs (:tabnew | terminal) from anywhere
for i = 1, 9 do
  map({ "n", "t" }, "<A-" .. i .. ">", "<cmd>tabnext " .. i .. "<CR>")
end

-- 3. Telescope Buffer Picker
-- Keeps <Space><Space> for Normal mode, uses <Alt-Space> or <Alt-b> in Terminal
map("t", "<A-Space>", "<cmd>Telescope buffers<CR>")

vim.api.nvim_create_autocmd("termopen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd.startinsert()
  end,
})
