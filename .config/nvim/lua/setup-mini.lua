-- require("mini.ai").setup()
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
