vim.keymap.set(
	"n",
	"<Leader>x",
	"<Cmd>write | source %<CR>",
	{ desc = "Save and execute" }
)

local Job = require("plenary.job")

local sync = function()
	Job:new({
		command = "rsync",
		args = {
			"--delete",
			"-ra",
			"--files-from=managed.txt",
			".",
			"/tmp/test",
		},
		cwd = "/home/gb/dots",
	}):sync()
	print("synced")
end

local group = vim.api.nvim_create_augroup("dots", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = group,
	pattern = "/home/gb/dots/*",
	callback = sync,
})

vim.api.nvim_create_autocmd("User", {
	group = group,
	pattern = "FugitiveChanged",
	callback = sync,
})

local nt = require("neo-tree.events")

local delete_handler = {
	event = "file_deleted",
	handler = sync,
	id = 3141,
}
nt.subscribe(delete_handler)

local rename_handler = {
	event = "file_renamed",
	handler = sync,
	id = 31415,
}
nt.subscribe(rename_handler)
