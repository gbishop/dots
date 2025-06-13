-- nvim/after/ftplugin/bake.lua
--
vim.bo.textwidth = 68
-- break lines at textwidth
vim.bo.formatoptions = vim.bo.formatoptions .. "t"

-- Run my bake script
vim.keymap.set("n", "<leader>r", function()
  local original_lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
  local formatted_lines

  formatted_lines = vim.fn.systemlist("python /home/gb/bake/bake.py", original_lines)
  if vim.v.shell_error ~= 0 then
    vim.notify(table.concat(formatted_lines, "\n"), vim.log.levels.ERROR)
    return
  end

  local view = vim.fn.winsaveview()
  vim.api.nvim_buf_set_lines(0, 0, -1, true, formatted_lines)
  vim.fn.winrestview(view)
end, { desc = "Format a recipe", buffer = true })

-- Run my bake script
vim.keymap.set("n", "<leader>R", function()
  local original_lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
  local formatted_lines

  formatted_lines = vim.fn.systemlist("python /home/gb/bake/bake.py -R", original_lines)
  if vim.v.shell_error ~= 0 then
    vim.notify(table.concat(formatted_lines, "\n"), vim.log.levels.ERROR)
    return
  end

  local view = vim.fn.winsaveview()
  vim.api.nvim_buf_set_lines(0, 0, -1, true, formatted_lines)
  vim.fn.winrestview(view)
end, { desc = "Format a recipe", buffer = true })
