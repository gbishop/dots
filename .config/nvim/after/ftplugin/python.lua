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
-- Run my bake script
vim.keymap.set("n", "<leader>r", function()
	local original_lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
	local formatted_lines

	formatted_lines = vim.fn.systemlist("python /home/gb/bake/run.py foo", original_lines)
	if vim.v.shell_error ~= 0 then
		error("\n\n" .. table.concat(formatted_lines, "\n") .. "\n")
	end

	local view = vim.fn.winsaveview()
	vim.api.nvim_buf_set_lines(0, 0, -1, true, formatted_lines)
	vim.fn.winrestview(view)
end, { desc = "Format a recipe" })
