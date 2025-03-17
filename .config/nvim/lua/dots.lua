-- manage my dotfiles

MiniDeps.add("nvim-lua/plenary.nvim")
local Job = require("plenary.job")

-- Copy the managed files to where they belong
local sync = function()
	---@diagnostic disable-next-line: missing-fields
	Job:new({
		command = "bash",
		args = {
			"deploy.sh",
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
	callback = function()
		---@diagnostic disable-next-line: undefined-field
		local cwd = vim.uv.cwd()
		if string.match(cwd, "/home/gb/dots/*") then
			sync()
		end
	end,
})
return dots
