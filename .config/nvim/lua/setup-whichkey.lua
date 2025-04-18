MiniDeps.add("folke/which-key.nvim")
local wk = require("which-key")
wk.setup({ delay = 1000, preset = "helix" })
wk.add({
  {
    mode = "v",
    ".",
    desc = "Smart subject",
  },
})
