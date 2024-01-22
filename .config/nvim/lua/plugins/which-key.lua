return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")

		wk.register({
			gc = "Comments",
			gb = "toggle blockwise comments",
			["g%"] = "Matchit Visual Backward",
		}, { mode = "o" })

		wk.register({
			gc = "Comments toggle",
			gb = "Comments toggle blockwise",
		}, { mode = "n" })

		wk.register({
			["<c-w><c-o>"] = "Close other windows",
		}, { mode = "n" })

		wk.register({ h = "Git" }, { prefix = "<leader>" })

		wk.register({
			["]m"] = "Jump to next function",
			["]]"] = "Jump to next class",
			["]M"] = "Jump to next function end",
			["]["] = "Jump to next class end",
			["[m"] = "Jump to previous function",
			["[["] = "Jump to previous class",
			["[M"] = "Jump to previous function end",
			["[]"] = "Jump to previous class end",
		}, { mode = "n" })

		wk.register({
			["]m"] = "Jump to next function",
			["]]"] = "Jump to next class",
			["]M"] = "Jump to next function end",
			["]["] = "Jump to next class end",
			["[m"] = "Jump to previous function",
			["[["] = "Jump to previous class",
			["[M"] = "Jump to previous function end",
			["[]"] = "Jump to previous class end",
		}, { mode = "o" })

		wk.register({
			["af"] = "function outer",
			["if"] = "function inner",
			["ac"] = "class outer",
			["ic"] = "class inner",
		}, { mode = "o" })

		wk.register({ s = "search" }, { prefix = "<leader>" })

		wk.register({
			[">"] = "shift right prefix",
			["<"] = "shift left prefix",
		}, { mode = "o" })
	end,
}
