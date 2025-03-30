MiniDeps.add("folke/which-key.nvim")
local wk = require("which-key")
wk.add({
  {
    mode = "v",
    ".",
    desc = "Smart subject",
  },
})
