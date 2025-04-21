MiniDeps.add({
  source = "nvim-telescope/telescope.nvim",
  depends = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "isak102/telescope-git-file-history.nvim",
    "tpope/vim-fugitive",
  },
})
local ts = require("telescope")
local tb = require("telescope.builtin")
local ta = require("telescope.actions")
local tas = require("telescope.actions.state")

local function my_find_files(opts)
  opts = opts or {}
  local hidden = vim.F.if_nil(opts.hidden, false)
  opts.attach_mappings = function(_, map)
    -- <C-h> to toggle modes
    map({ "n", "i" }, "<C-h>", function(prompt_bufnr)
      local prompt = tas.get_current_line()
      ta.close(prompt_bufnr)
      opts.hidden = not hidden
      opts.default_text = prompt
      my_find_files(opts)
    end)
    -- .. to move to parent
    map({ "i" }, "..", function(prompt_bufnr)
      -- cwd is only set if passed as telescope option
      local cwd = opts.cwd or vim.loop.cwd()
      local parent_dir = vim.fs.dirname(cwd)

      ta.close(prompt_bufnr)
      opts.prompt_title = vim.fs.basename(parent_dir)
      opts.cwd = parent_dir
      my_find_files(opts)
    end)
    return true
  end

  opts.hidden = hidden
  opts.prompt_title = opts.cwd
  tb.find_files(opts)
end

local function find_files_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", "./;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts.cwd = get_git_root()
  end
  opts.hidden = true
  my_find_files(opts)
end

ts.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    file_ignore_patterns = { "dist" },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

ts.load_extension("file_browser")
ts.load_extension("git_file_history")

--Add keymaps
vim.keymap.set("n", "<leader><space>", function()
  tb.buffers({ sort_mru = true, ignore_current_buffer = true })
end, { desc = "buffers" })
vim.keymap.set(
  "n",
  "<leader>sb",
  tb.current_buffer_fuzzy_find,
  { desc = "fuzzy buffers" }
)
vim.keymap.set(
  "n",
  "<leader>,",
  find_files_from_project_git_root,
  { desc = "project files" }
)
vim.keymap.set("n", "<leader>.", function()
  return my_find_files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "local files" })
vim.keymap.set("n", "<leader>sc", tb.commands, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", tb.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sf", my_find_files, { desc = "files" })
vim.keymap.set("n", "<leader>sg", tb.live_grep, { desc = "live grep" })
vim.keymap.set("n", "<leader>sh", tb.help_tags, { desc = "help tags" })
vim.keymap.set("n", "<leader>sk", tb.keymaps, { desc = "Key Maps" })
vim.keymap.set("n", "<leader>sr", tb.lsp_references, { desc = "lsp references" })
vim.keymap.set("n", "<leader>st", tb.tags, { desc = "tags" })
vim.keymap.set("n", "<leader>sT", function()
  tb.tags({ only_current_buffer = true })
end, { desc = "tags current" })
vim.keymap.set("n", "<leader>?", tb.oldfiles, { desc = "old files" })
