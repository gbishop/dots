return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvim-telescope/telescope.nvim",
		"Fildo7525/pretty_hover",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"marksman",
				"pyright",
				"intelephense",
			},
		})
		local lspconfig = require("lspconfig")
		local tb = require("telescope.builtin")
		local pretty_hover = require("pretty_hover")

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
				pretty_hover.hover,
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
		end

		-- nvim-cmp supports additional completion capabilities
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Enable the following language servers
		local servers = {
			"ts_ls",
			"html",
			"cssls",
			"jsonls",
			"marksman",
			"pyright",
		}
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				-- capabilities = capabilities,
			})
		end

		lspconfig.intelephense.setup({
			settings = {
				intelephense = {
					stubs = {
						"bcmath",
						"bz2",
						"Core",
						"curl",
						"date",
						"dom",
						"fileinfo",
						"filter",
						"gd",
						"gettext",
						"hash",
						"iconv",
						"imap",
						"intl",
						"json",
						"libxml",
						"mbstring",
						"mcrypt",
						"mysql",
						"mysqli",
						"openssl",
						"password",
						"pcntl",
						"pcre",
						"PDO",
						"pdo_mysql",
						"Phar",
						"readline",
						"regex",
						"session",
						"SimpleXML",
						"sockets",
						"sodium",
						"standard",
						"superglobals",
						"tokenizer",
						"xml",
						"xdebug",
						"xmlreader",
						"xmlwriter",
						"yaml",
						"zip",
						"zlib",
						"wordpress",
						"wordpress-stubs",
						"woocommerce-stubs",
						"acf-pro-stubs",
						"wordpress-globals",
						"wp-cli-stubs",
						"genesis-stubs",
						"polylang-stubs",
					},
				},
			},
		})

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
						library = {
							vim.api.nvim_get_runtime_file("", true),
							vim.fn.expand("$VIMRUNTIME/lua")
								< vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
							vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
							"${3rd}/luv/library",
						},
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
