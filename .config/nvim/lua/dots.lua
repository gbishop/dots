local Job = require("plenary.job")

-- Copy the managed files to where they belong
local sync = function()
	Job:new({
		command = "rsync",
		args = {
			"--delete",
			"-rlt",
			"--files-from=managed.txt",
			".",
			"/home/gb/",
		},
		cwd = "/home/gb/dots",
	}):sync()
end

local dots = { sync = sync }

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
return dots
