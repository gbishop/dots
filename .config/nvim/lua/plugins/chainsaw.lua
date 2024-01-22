return {
	"chrisgrieser/nvim-chainsaw",
	config = function()
		local cs = require("chainsaw")
		cs.setup({
			logStatements = {
				objectLog = {
					javascript = 'console.log("%s %s:", (%s).toObject())',
				},
				assertLog = {
					javascript = 'console.assert("%s" && %s, %s)',
				},
			},
		})

		vim.keymap.set("n", "<leader>dm", cs.messageLog, { desc = "log message" })
		vim.keymap.set("n", "<leader>dv", cs.variableLog, { desc = "log variable" })
		vim.keymap.set("n", "<leader>do", cs.objectLog, { desc = "log object" })
		vim.keymap.set("n", "<leader>da", cs.assertLog, { desc = "log assert" })
		vim.keymap.set("n", "<leader>db", cs.beepLog, { desc = "log beep" })
		vim.keymap.set("n", "<leader>dt", cs.timeLog, { desc = "log time" })
		vim.keymap.set("n", "<leader>dd", cs.debugLog, { desc = "log debug" })
		vim.keymap.set("n", "<leader>dr", cs.removeLogs, { desc = "log remove" })
	end,
}
