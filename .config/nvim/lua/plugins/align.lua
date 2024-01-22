--[[

https://github.com/Vonr/align.nvim

align.nvim is a minimal plugin for NeoVim for aligning lines

align.nvim supports aligning lines to the most feasible leftward or 
rightmost character, string, or Lua pattern.

Escapes for Lua patterns can either be % or \, the latter both of 
which can be escaped again with another \.

--]]

return {
	"Vonr/align.nvim",
	config = function()
		local NS = { noremap = true, silent = true }

		vim.keymap.set("x", "aa", function()
			require("align").align_to_char(1, true)
		end, NS) -- Aligns to 1 character, looking left
		vim.keymap.set("x", "as", function()
			require("align").align_to_char(2, true, true)
		end, NS) -- Aligns to 2 characters, looking left and with previews
		vim.keymap.set("x", "aw", function()
			require("align").align_to_string(false, true, true)
		end, NS) -- Aligns to a string, looking left and with previews
		vim.keymap.set("x", "ar", function()
			require("align").align_to_string(true, true, true)
		end, NS) -- Aligns to a Lua pattern, looking left and with previews
	end,
}
