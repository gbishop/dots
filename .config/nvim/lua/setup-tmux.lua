MiniDeps.add("aserowy/tmux.nvim")
local tmux = require("tmux")
tmux.setup({
  copy_sync = {
    enable = false,
  },
})
MiniDeps.add("tpope/vim-tbone")
