MiniDeps.add({
  source = "nvim-treesitter/nvim-treesitter",
  hooks = {
    post_checkout = function()
      vim.cmd("TSUpdate")
    end,
  },
})
MiniDeps.add("nvim-treesitter/nvim-treesitter-textobjects")

-- 1. Main Treesitter Setup
require("nvim-treesitter").setup({
  ensure_installed = {
    "markdown",
    "html",
    "bash",
    "jsdoc",
    "css",
    "vimdoc",
    "vim",
    "typescript",
    "markdown_inline",
    "lua",
    "javascript",
    "regex",
    "query",
    "python",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

-- 2. Textobjects Setup (Direct root keys)
require("nvim-treesitter-textobjects").setup({
  select = {
    enable = true,
    lookahead = true,
  },
  move = {
    enable = true,
    set_jumps = true,
  },
})

-- 3. Explicit Keymaps for Visual and Operator-Pending modes
vim.keymap.set({ "x", "o" }, "af", function()
  require("nvim-treesitter-textobjects.select").select_textobject(
    "@function.outer",
    "textobjects"
  )
end, { desc = "Select around function" })

vim.keymap.set({ "x", "o" }, "if", function()
  require("nvim-treesitter-textobjects.select").select_textobject(
    "@function.inner",
    "textobjects"
  )
end, { desc = "Select inside function" })

vim.keymap.set({ "x", "o" }, "ac", function()
  require("nvim-treesitter-textobjects.select").select_textobject(
    "@class.outer",
    "textobjects"
  )
end, { desc = "Select around class" })

vim.keymap.set({ "x", "o" }, "ic", function()
  require("nvim-treesitter-textobjects.select").select_textobject(
    "@class.inner",
    "textobjects"
  )
end, { desc = "Select inside class" })
