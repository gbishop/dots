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

local LspAttachGroup = vim.api.nvim_create_augroup("LspAttachGroup", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = LspAttachGroup,
  callback = function(args)
    local bufnr = args.buf
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
  end,
})

MiniDeps.add({
  source = "stevearc/conform.nvim",
})
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettierd" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
