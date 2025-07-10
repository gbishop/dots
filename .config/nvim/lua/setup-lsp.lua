local add = MiniDeps.add

add("nvim-telescope/telescope.nvim")
add("mawkler/refjump.nvim")
add({
  source = "neovim/nvim-lspconfig",
  depends = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
})
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "cssls",
    "emmet_ls",
    "html",
    "intelephense",
    "jsonls",
    "lua_ls",
    "marksman",
    "pyright",
    "ts_ls",
  },
  automatic_enable = {
    exclude = { "pyright" },
  },
})
require("mason-tool-installer").setup({
  ensure_installed = {
    "black",
    "prettierd",
    "stylua",
  },
})

local lspconfig = require("lspconfig")
local tb = require("telescope.builtin")
require("refjump").setup()

-- apparently required for border on hover
vim.o.winborder = "rounded"

local on_attach = function(_, bufnr)
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
  vim.keymap.set(
    "n",
    "<leader>e",
    vim.diagnostic.open_float,
    { buffer = bufnr, desc = "Line diagnostics" }
  )
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
    vim.lsp.buf.format({ async = true })
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable the following language servers
local servers = {
  "cssls",
  "emmet_ls",
  "html",
  "jsonls",
  "marksman",
  "pyright",
  "ts_ls",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
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
          vim.fn.expand("$VIMRUNTIME/lua") < vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          "${3rd}/luv/library",
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      format = {
        enable = false,
      },
    },
  },
})

MiniDeps.add({
  source = "nvimtools/none-ls.nvim",
  name = "null_ls",
  depends = {
    "nvim-lua/plenary.nvim",
  },
})
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    formatting.black,
    formatting.prettierd,
    formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            async = false,
            filter = function(fclient)
              return fclient.name == "null-ls"
            end,
          })
        end,
      })
    end
  end,
})
