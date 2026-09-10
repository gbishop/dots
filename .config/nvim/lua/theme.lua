-- theme setup

MiniDeps.add("rebelot/kanagawa.nvim")
require("kanagawa").setup({
  theme = "dragon",
  background = {
    dark = "dragon",
  },
  dimInactive = true,
})

-- Map Neovim scheme to WezTerm scheme name
-- local theme_map = {
--   ["carbonfox"] = "Carbonfox",
--   ["kanagawa"] = "Kanagawa Dragon (Gogh)",
-- }

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   desc = "Sync active theme to WezTerm",
--   callback = function(args)
--     local wez_theme = theme_map[args.match] or args.match
--     local path = vim.fn.expand("~/.config/wezterm/theme.txt")
--     local f = io.open(path, "w")
--     if f then
--       f:write(wez_theme)
--       f:close()
--     end
--   end,
-- })
--
vim.cmd("colorscheme kanagawa")
