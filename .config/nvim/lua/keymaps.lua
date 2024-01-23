-- Macros get in my way
vim.keymap.set("n", "q", "<Nop>", { silent = true })

-- Save with control s
vim.keymap.set("n", "<C-s>", "<Cmd>wa<CR>", { desc = "Save" })
vim.keymap.set(
	{ "i", "x" },
	"<C-s>",
	"<Esc><Cmd>wa<CR>",
	{ desc = "Save and go to normal" }
)

--Remap for dealing with word wrap
vim.keymap.set(
	"n",
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Move up" }
)
vim.keymap.set(
	"n",
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move down" }
)

-- for jumping out of parenthesis in input mode
vim.cmd(
	"inoremap <silent> <C-l> <c-\\><c-n>:call searchpair('[([{]', '', '[)\\]}]', 'W')<cr>a"
)

-- scrolling should not paste
vim.keymap.set({ "n", "i" }, "<MiddleMouse>", "<Nop>")
for i = 2, 4 do
	vim.keymap.set({ "n", "i" }, string.format("<%d-MiddleMouse>", i), "<Nop>")
end

-- if I use the mouse to move leave input mode
vim.cmd([[
inoremap <LeftMouse> <Esc><LeftMouse>
]])

-- open file in same folder as current buffer
vim.cmd([[
map ,e :e <C-R>=expand("%:h") . "/" <CR>
]])
