require("mini.ai").setup()
require("mini.align").setup({})
require("mini.animate").setup()
require("mini.bracketed").setup({})
require("mini.colors").setup({})
require("mini.comment").setup()
require("mini.files").setup()
require("mini.icons").setup()
require("mini.indentscope").setup({})
require("mini.jump").setup()
require("mini.jump2d").setup()
local MiniNotify = require("mini.notify")
MiniNotify.setup()
vim.notify = MiniNotify.make_notify({
  ERROR = { duration = 15000 },
  WARN = { duration = 4000 },
  INFO = { duration = 3000 },
})
-- require("mini.pairs").setup()

local MiniPick = require("mini.pick")
MiniPick.setup()
-- Use the mini select
vim.ui.select = MiniPick.ui_select

local snippets = require("mini.snippets")
local gen_loader = snippets.gen_loader
snippets.setup({
  snippets = {
    gen_loader.from_lang(),
  },
})

require("mini.completion").setup({
  delay = {
    completion = 10 ^ 7,
    info = 100,
    signature = 100,
  },
})

local function has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
      == nil
end

-- trigger completion with tab
vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-n>"
  elseif has_words_before() then
    return "<C-Space>"
  else
    return "<Tab>"
  end
end, {
  expr = true,
  remap = true,
  desc = "Tab/Complete/Next",
})

-- goto previous with S-Tab
vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-p>"
  else
    return "<S-Tab>"
  end
end, {
  expr = true,
  remap = false,
  desc = "S-Tab/Previous",
})

local miniclue = require("mini.clue")

-- Add clues for text objects so I can learn them
-- from: https://github.com/echasnovski/mini.nvim/issues/430#issuecomment-1703220671
miniclue.gen_clues.text_objects = function()
  local i = {
    [" "] = "Whitespace",
    ['"'] = 'Balanced "',
    ["'"] = "Balanced '",
    ["`"] = "Balanced `",
    ["("] = "Balanced (",
    [")"] = "Balanced ) including white-space",
    [">"] = "Balanced > including white-space",
    ["<lt>"] = "Balanced <",
    ["]"] = "Balanced ] including white-space",
    ["["] = "Balanced [",
    ["}"] = "Balanced } including white-space",
    ["{"] = "Balanced {",
    ["?"] = "User Prompt",
    _ = "Underscore",
    a = "Argument",
    b = "Balanced ), ], }",
    c = "Class",
    f = "Function",
    o = "Block, conditional, loop",
    q = "Quote `, \", '",
    t = "Tag",
  }
  local a = vim.deepcopy(i)
  for k, v in pairs(a) do
    a[k] = v:gsub(" including.*", "")
  end

  local clues = {}
  for key, name in pairs(i) do
    table.insert(clues, { mode = "o", keys = "i" .. key, desc = "Inside " .. name })
    table.insert(clues, { mode = "x", keys = "i" .. key, desc = "Inside " .. name })
  end
  for key, name in pairs(a) do
    table.insert(clues, { mode = "o", keys = "a" .. key, desc = "Around " .. name })
    table.insert(clues, { mode = "x", keys = "a" .. key, desc = "Around " .. name })
  end

  for key1, name1 in pairs({ n = "Next", l = "Last" }) do
    for key2, name2 in pairs(i) do
          -- stylua: ignore
          table.insert(clues, { mode = "o", keys = "i" .. key1 .. key2, desc = "Inside " .. name1 .. " " .. name2 })
    end
    for key2, name2 in pairs(a) do
          -- stylua: ignore
          table.insert(clues, { mode = "o", keys = "a" .. key1 .. key2, desc = "Around " .. name1 .. " " .. name2 })
    end
  end

  return clues
end

miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },

    -- bracketed
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },
    { mode = "x", keys = "[" },
    { mode = "x", keys = "]" },

    -- text objects
    { mode = "o", keys = "i", desc = "inside" },
    { mode = "o", keys = "a", desc = "around" },
    { mode = "x", keys = "i", desc = "inside" },
    { mode = "x", keys = "a", desc = "around" },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
    miniclue.gen_clues.text_objects(),
  },
})
