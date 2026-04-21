MiniDeps.add({
  source = "nvim-treesitter/nvim-treesitter",
  hooks = {
    post_checkout = function()
      vim.cmd("TSUpdate")
    end,
  },
})
MiniDeps.add("nvim-treesitter/nvim-treesitter-textobjects")
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
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<M-w>",
      node_incremental = "v",
      scope_incremental = "<M-e>",
      node_decremental = "V",
    },
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
    filetypes = {
      "css",
      "html",
      "javascript",
      "lua",
      "typescript",
      "python",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["as"] = { query = "@statement.outer", desc = "Select statement" },
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
})
