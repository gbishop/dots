local Job = require("plenary.job")

-- Copy the managed files to where they belong
local sync = function()
	Job:new({
		command = "rsync",
		args = {
			"--delete",
			"-ra",
			"--files-from=managed.txt",
			".",
			"/home/gb/",
		},
		cwd = "/home/gb/dots",
	}):sync()
	print("synced")
end

local group = vim.api.nvim_create_augroup("dots", { clear = true })

-- sync whenever I write a file in the repo
vim.api.nvim_create_autocmd("BufWritePost", {
	group = group,
	pattern = "/home/gb/dots/*",
	callback = sync,
})

-- sync when git makes changes
vim.api.nvim_create_autocmd("User", {
	group = group,
	pattern = "FugitiveChanged",
	callback = sync,
})

local nt = require("neo-tree.events")

local nt_events = { "file_added", "file_deleted", "file_renamed", "file_moved" }

for i, event in ipairs(nt_events) do
	nt.subscribe({
		event = event,
		handler = sync,
		id = 3140 + i,
	})
end
