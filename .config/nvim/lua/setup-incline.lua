MiniDeps.add("b0o/incline.nvim")
local function get_diagnostic_label(props)
  local icons = {
    Error = "",
    Warn = "",
    Info = "",
    Hint = "",
  }

  local label = {}
  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(
      props.buf,
      { severity = vim.diagnostic.severity[string.upper(severity)] }
    )
    if n > 0 then
      table.insert(
        label,
        { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity }
      )
    end
  end
  return label
end

require("incline").setup({
  render = function(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    local filename = vim.fn.fnamemodify(bufname, ":t")
    local diagnostics = get_diagnostic_label(props)
    local modified = vim.api.nvim_get_option_value("modified", { buf = props.buf })
        and "bold,italic"
      or "None"

    local buffer = {
      { filename, gui = modified },
    }

    if #diagnostics > 0 then
      table.insert(diagnostics, { "| ", guifg = "grey" })
    end
    for _, buffer_ in ipairs(buffer) do
      table.insert(diagnostics, buffer_)
    end
    return diagnostics
  end,
})
