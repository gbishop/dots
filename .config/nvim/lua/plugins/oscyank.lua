return {
	"ojroques/vim-oscyank",
	config = function()
		-- Highlight on yank
		local highlight_group =
			vim.api.nvim_create_augroup("YankHighlight", { clear = true })
		vim.api.nvim_create_autocmd("TextYankPost", {
			callback = function()
				vim.highlight.on_yank()
				-- Use OSC52 to copy yanks into terminal clipboard
				if vim.v.event.operator == "y" and vim.v.event.regname == "" then
					vim.cmd("OSCYankRegister 0")
				end
			end,
			group = highlight_group,
			pattern = "*",
		})
		vim.g.oscyank_term = "default"
	end,
}
