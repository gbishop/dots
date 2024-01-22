-- bind a key to send code to python in another tmux pane
vim.keymap.set(
	"n",
	"<leader>p",
	"vapy:!tmux-paste-to-python<CR>]]",
	{ desc = "Send chunk to python", silent = true }
)
vim.keymap.set(
	"n",
	"<leader>P",
	"vapy:!tmux-paste-to-python<CR>",
	{ desc = "Send chunk to python,stay", silent = true }
)
