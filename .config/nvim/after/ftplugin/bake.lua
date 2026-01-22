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

local function format_to_bullet()
  vim.cmd("normal! (")
  local bufnr = 0
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local line_num = cursor_pos[1] - 1
  local line_content = vim.api.nvim_buf_get_lines(bufnr, line_num, line_num + 1, false)[1]

  local new_line
  -- Logic: Check if line starts with optional space, a marker (*, -, or 1.), and a space
  if line_content:match("^%s*[%*%-%d+%.•]+%s+") then
    -- CASE 1: Replace existing marker, keep indentation
    new_line = line_content:gsub("^(%s*)[%*%-%d+%.•]+%s+", "%1• ")
  else
    -- CASE 2: No marker found, prepend bullet to the start of the text (after indentation)
    new_line = line_content:gsub("^(%s*)(.*)", "%1• %2")
  end

  -- Apply changes
  vim.api.nvim_buf_set_lines(bufnr, line_num, line_num + 1, false, { new_line })

  -- Format paragraph
  vim.cmd("normal! gwip")

  -- Restore cursor to the start of the line
  vim.api.nvim_win_set_cursor(0, { line_num + 1, 0 })
end

vim.keymap.set(
  "n",
  "<leader>b",
  format_to_bullet,
  { desc = "Bulletize and format paragraph" }
)
