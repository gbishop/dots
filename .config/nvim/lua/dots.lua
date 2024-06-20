vim.keymap.set(
	"n",
	"<Leader>x",
	"<Cmd>write | source %<CR>",
	{ desc = "Save and execute" }
)

local installed_name = function(repo_name)
	if string.match(repo_name, "/home/gb/dots/") then
		return string.gsub(repo_name, "/dots/", "/")
	end
	return nil
end

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("dots", { clear = true }),
	pattern = "/home/gb/dots/*",
	callback = function()
		local repo_name = vim.api.nvim_buf_get_name(0)
		local iname = installed_name(repo_name)
		if iname then
			local write = "write! ++p " .. iname
			vim.cmd(write)
		end
	end,
})

local nt = require("neo-tree.events")

local delete_handler = {
	event = "file_deleted",
	handler = function(arg)
		local iname = installed_name(arg)
		if iname then
			os.remove(iname)
			print("deleted", iname)
		end
	end,
	id = 3141,
}
nt.subscribe(delete_handler)

local rename_handler = {
	event = "file_renamed",
	handler = function(arg)
		local iname = installed_name(arg.source)
		local nname = installed_name(arg.destination)
		if iname then
			if nname then
				os.rename(iname, nname)
				print("renamed", iname, "->", nname)
			else
				os.remove(iname)
				print("deleted", iname)
			end
		end
	end,
	id = 31415,
}
nt.subscribe(rename_handler)
