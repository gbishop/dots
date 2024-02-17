return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"html",
				"cssls",
				"jsonls",
				"marksman",
				"pyright",
			},
		})
		local lspconfig = require("lspconfig")
		local tb = require("telescope.builtin")

		local on_attach = function(_, bufnr)
			-- for MiniCompletion
			vim.o.omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

			vim.keymap.set(
				"n",
				"gD",
				vim.lsp.buf.declaration,
				{ buffer = bufnr, desc = "Jump to declaration" }
			)
			vim.keymap.set(
				"n",
				"gd",
				vim.lsp.buf.definition,
				{ buffer = bufnr, desc = "Jump to definition" }
			)
			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{ buffer = bufnr, desc = "LSP hover" }
			)
			vim.keymap.set(
				"n",
				"gi",
				vim.lsp.buf.implementation,
				{ buffer = bufnr, desc = "Jump to implementation" }
			)
			vim.keymap.set(
				"n",
				"gt",
				vim.lsp.buf.type_definition,
				{ buffer = bufnr, desc = "Jump to type definition" }
			)
			vim.keymap.set(
				"n",
				"<leader>lr",
				vim.lsp.buf.rename,
				{ buffer = bufnr, desc = "LSP rename" }
			)
			vim.keymap.set(
				"n",
				"gr",
				vim.lsp.buf.references,
				{ buffer = bufnr, desc = "Get references" }
			)
			vim.keymap.set(
				"n",
				"<leader>la",
				vim.lsp.buf.code_action,
				{ buffer = bufnr, desc = "LSP code action" }
			)
			vim.keymap.set(
				"n",
				"<leader>so",
				tb.lsp_document_symbols,
				{ buffer = bufnr, desc = "Document symbols" }
			)
			vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
				vim.lsp.buf.format({ async = true })
			end, {})
			vim.keymap.set(
				"n",
				"<leader>ll",
				require("lsp_lines").toggle,
				{ buffer = bufnr, desc = "Toggle lsp lines" }
			)
		end

		-- nvim-cmp supports additional completion capabilities
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Enable the following language servers
		local servers = { "tsserver", "html", "cssls", "jsonls", "marksman", "pyright" }
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				-- capabilities = capabilities,
			})
		end

		-- Example custom server
		-- Make runtime files discoverable to the server
		local runtime_path = vim.split(package.path, ";")
		table.insert(runtime_path, "lua/?.lua")
		table.insert(runtime_path, "lua/?/init.lua")

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			-- capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Setup your lua path
						path = runtime_path,
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
}
