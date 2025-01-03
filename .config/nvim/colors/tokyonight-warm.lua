-- Made with 'mini.colors' module of https://github.com/echasnovski/mini.nvim

if vim.g.colors_name ~= nil then vim.cmd('highlight clear') end
vim.g.colors_name = "tokyonight-warm"

-- Highlight groups
local hi = vim.api.nvim_set_hl

hi(0, "@annotation", { fg = "#72dbc1" })
hi(0, "@attribute", { fg = "#72dbc1" })
hi(0, "@boolean", { fg = "#dcb541" })
hi(0, "@character", { fg = "#dfb741" })
hi(0, "@character.special", { fg = "#6bc689" })
hi(0, "@comment", { fg = "#7a5372", italic = true })
hi(0, "@conditional", { fg = "#f288ac" })
hi(0, "@constant", { fg = "#dcb541" })
hi(0, "@constant.builtin", { fg = "#6bc689" })
hi(0, "@constant.macro", { fg = "#72dbc1" })
hi(0, "@constructor", { fg = "#f288ac" })
hi(0, "@debug", { fg = "#6bc689" })
hi(0, "@define", { fg = "#72dbc1" })
hi(0, "@exception", { fg = "#f288ac" })
hi(0, "@field", { fg = "#b9cf86" })
hi(0, "@float", { fg = "#dcb541" })
hi(0, "@function", { fg = "#01bac8" })
hi(0, "@function.builtin", { fg = "#6bc689" })
hi(0, "@function.call", { fg = "#01bac8" })
hi(0, "@function.macro", { fg = "#72dbc1" })
hi(0, "@include", { fg = "#72dbc1" })
hi(0, "@keyword", { fg = "#d26a8f", italic = true })
hi(0, "@keyword.coroutine", { fg = "#d26a8f", italic = true })
hi(0, "@keyword.function", { fg = "#f288ac" })
hi(0, "@keyword.operator", { fg = "#92e4c1" })
hi(0, "@keyword.return", { fg = "#d26a8f", italic = true })
hi(0, "@label", { fg = "#01bac8" })
hi(0, "@lsp.type.comment", { link = "@comment" })
hi(0, "@lsp.type.enum", { link = "@type" })
hi(0, "@lsp.type.enumMember", { link = "@constant" })
hi(0, "@lsp.type.interface", { link = "@type" })
hi(0, "@lsp.type.keyword", { link = "@keyword" })
hi(0, "@lsp.type.namespace", { link = "@namespace" })
hi(0, "@lsp.type.parameter", { link = "@parameter" })
hi(0, "@lsp.type.property", { link = "@property" })
hi(0, "@lsp.type.variable", {})
hi(0, "@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
hi(0, "@lsp.typemod.method.defaultLibrary", { link = "@function.builtin" })
hi(0, "@lsp.typemod.operator.injected", { link = "@operator" })
hi(0, "@lsp.typemod.string.injected", { link = "@string" })
hi(0, "@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
hi(0, "@lsp.typemod.variable.injected", { link = "@variable" })
hi(0, "@method", { fg = "#01bac8" })
hi(0, "@method.call", { fg = "#01bac8" })
hi(0, "@namespace", { link = "Include" })
hi(0, "@number", { fg = "#dcb541" })
hi(0, "@operator", { fg = "#92e4c1" })
hi(0, "@parameter", { fg = "#d3b665" })
hi(0, "@preproc", { fg = "#72dbc1" })
hi(0, "@property", { fg = "#b9cf86" })
hi(0, "@punctuation.bracket", { fg = "#caa7c1" })
hi(0, "@punctuation.delimiter", { fg = "#92e4c1" })
hi(0, "@punctuation.special", { fg = "#92e4c1" })
hi(0, "@punctuation.special.markdown", { bold = true, fg = "#dcb541" })
hi(0, "@repeat", { fg = "#f288ac" })
hi(0, "@storageclass", { fg = "#6bc689" })
hi(0, "@string", { fg = "#dfb741" })
hi(0, "@string.documentation", { fg = "#d3b665" })
hi(0, "@string.escape", { fg = "#f288ac" })
hi(0, "@string.regex", { fg = "#d7f5c7" })
hi(0, "@string.special", { fg = "#6bc689" })
hi(0, "@symbol", { fg = "#f288ac" })
hi(0, "@tag", { fg = "#f288ac" })
hi(0, "@tag.attribute", { fg = "#b9cf86" })
hi(0, "@tag.delimiter", { fg = "#6bc689" })
hi(0, "@text", {})
hi(0, "@text.danger", { bg = "#db4b4b", fg = "#23181f" })
hi(0, "@text.diff.add", { link = "DiffAdd" })
hi(0, "@text.diff.delete", { link = "DiffDelete" })
hi(0, "@text.emphasis", { italic = true })
hi(0, "@text.environment", { fg = "#72dbc1" })
hi(0, "@text.environment.name", { fg = "#6bc689" })
hi(0, "@text.literal", { fg = "#dfb741" })
hi(0, "@text.literal.markdown_inline", { bg = "#414868", fg = "#01bac8" })
hi(0, "@text.math", { fg = "#6bc689" })
hi(0, "@text.note", { fg = "#6bc689" })
hi(0, "@text.reference", { fg = "#a1ab3f" })
hi(0, "@text.strike", { strikethrough = true })
hi(0, "@text.strong", { bold = true })
hi(0, "@text.title", { bold = true, fg = "#01bac8" })
hi(0, "@text.todo", { bg = "#e0af68", fg = "#23181f" })
hi(0, "@text.todo.checked", { fg = "#b9cf86" })
hi(0, "@text.todo.unchecked", { fg = "#01bac8" })
hi(0, "@text.underline", { underline = true })
hi(0, "@text.uri", { underline = true })
hi(0, "@text.warning", { bg = "#e0af68", fg = "#23181f" })
hi(0, "@type", { fg = "#6bc689" })
hi(0, "@type.builtin", { fg = "#6bc689" })
hi(0, "@type.definition", { fg = "#6bc689" })
hi(0, "@type.qualifier", { fg = "#d26a8f", italic = true })
hi(0, "@variable", { fg = "#e6bedc" })
hi(0, "@variable.builtin", { fg = "#e29100" })
hi(0, "ALEErrorSign", { fg = "#a77c00" })
hi(0, "ALEWarningSign", { fg = "#d3b665" })
hi(0, "ActiveWindow", { bg = "#1a1b26" })
hi(0, "AlphaButtons", { fg = "#72dbc1" })
hi(0, "AlphaFooter", { fg = "#6bc689" })
hi(0, "AlphaHeader", { fg = "#01bac8" })
hi(0, "AlphaHeaderLabel", { fg = "#dcb541" })
hi(0, "AlphaShortcut", { fg = "#dcb541" })
hi(0, "Bold", { bold = true })
hi(0, "BufferAlternate", { bg = "#3b4261", fg = "#e6bedc" })
hi(0, "BufferAlternateERROR", { bg = "#3b4261", fg = "#a77c00" })
hi(0, "BufferAlternateHINT", { bg = "#3b4261", fg = "#a1ab3f" })
hi(0, "BufferAlternateINFO", { bg = "#3b4261", fg = "#5cbd82" })
hi(0, "BufferAlternateIndex", { bg = "#3b4261", fg = "#5cbd82" })
hi(0, "BufferAlternateMod", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "BufferAlternateSign", { bg = "#3b4261", fg = "#5cbd82" })
hi(0, "BufferAlternateTarget", { bg = "#3b4261", fg = "#e29100" })
hi(0, "BufferAlternateWARN", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "BufferCurrent", { bg = "#1a1b26", fg = "#e6bedc" })
hi(0, "BufferCurrentERROR", { bg = "#1a1b26", fg = "#a77c00" })
hi(0, "BufferCurrentHINT", { bg = "#1a1b26", fg = "#a1ab3f" })
hi(0, "BufferCurrentINFO", { bg = "#1a1b26", fg = "#5cbd82" })
hi(0, "BufferCurrentIndex", { bg = "#1a1b26", fg = "#5cbd82" })
hi(0, "BufferCurrentMod", { bg = "#1a1b26", fg = "#d3b665" })
hi(0, "BufferCurrentSign", { bg = "#1a1b26", fg = "#23181f" })
hi(0, "BufferCurrentTarget", { bg = "#1a1b26", fg = "#e29100" })
hi(0, "BufferCurrentWARN", { bg = "#1a1b26", fg = "#d3b665" })
hi(0, "BufferInactive", { bg = "#292e42", fg = "#7e5e75" })
hi(0, "BufferInactiveERROR", { bg = "#292e42", fg = "#8d6600" })
hi(0, "BufferInactiveHINT", { bg = "#292e42", fg = "#838f39" })
hi(0, "BufferInactiveINFO", { bg = "#292e42", fg = "#499d6e" })
hi(0, "BufferInactiveIndex", { bg = "#292e42", fg = "#956f8b" })
hi(0, "BufferInactiveMod", { bg = "#292e42", fg = "#ad9759" })
hi(0, "BufferInactiveSign", { bg = "#292e42", fg = "#23181f" })
hi(0, "BufferInactiveTarget", { bg = "#292e42", fg = "#e29100" })
hi(0, "BufferInactiveWARN", { bg = "#292e42", fg = "#ad9759" })
hi(0, "BufferLineIndicatorSelected", { fg = "#259399" })
hi(0, "BufferOffset", { bg = "#16161e", fg = "#956f8b" })
hi(0, "BufferTabpageFill", { bg = "#2a2b35", fg = "#956f8b" })
hi(0, "BufferTabpages", { bg = "#16161e" })
hi(0, "BufferVisible", { bg = "#16161e", fg = "#e6bedc" })
hi(0, "BufferVisibleERROR", { bg = "#16161e", fg = "#a77c00" })
hi(0, "BufferVisibleHINT", { bg = "#16161e", fg = "#a1ab3f" })
hi(0, "BufferVisibleINFO", { bg = "#16161e", fg = "#5cbd82" })
hi(0, "BufferVisibleIndex", { bg = "#16161e", fg = "#5cbd82" })
hi(0, "BufferVisibleMod", { bg = "#16161e", fg = "#d3b665" })
hi(0, "BufferVisibleSign", { bg = "#16161e", fg = "#5cbd82" })
hi(0, "BufferVisibleTarget", { bg = "#16161e", fg = "#e29100" })
hi(0, "BufferVisibleWARN", { bg = "#16161e", fg = "#d3b665" })
hi(0, "Character", { fg = "#dfb741" })
hi(0, "CmpDocumentation", { bg = "#16161e", fg = "#e6bedc" })
hi(0, "CmpDocumentationBorder", { bg = "#16161e", fg = "#57a473" })
hi(0, "CmpItemAbbr", { fg = "#e6bedc" })
hi(0, "CmpItemAbbrDeprecated", { fg = "#563950", strikethrough = true })
hi(0, "CmpItemAbbrMatch", { fg = "#6bc689" })
hi(0, "CmpItemAbbrMatchFuzzy", { fg = "#6bc689" })
hi(0, "CmpItemKindClass", { fg = "#dcb541" })
hi(0, "CmpItemKindConstant", { fg = "#f288ac" })
hi(0, "CmpItemKindConstructor", { fg = "#01bac8" })
hi(0, "CmpItemKindCopilot", { fg = "#a1ab3f" })
hi(0, "CmpItemKindDefault", { fg = "#caa7c1" })
hi(0, "CmpItemKindEnum", { fg = "#dcb541" })
hi(0, "CmpItemKindEnumMember", { fg = "#b9cf86" })
hi(0, "CmpItemKindEvent", { fg = "#dcb541" })
hi(0, "CmpItemKindField", { fg = "#b9cf86" })
hi(0, "CmpItemKindFunction", { fg = "#01bac8" })
hi(0, "CmpItemKindInterface", { fg = "#dcb541" })
hi(0, "CmpItemKindKeyword", { fg = "#72dbc1" })
hi(0, "CmpItemKindMethod", { fg = "#01bac8" })
hi(0, "CmpItemKindModule", { fg = "#d3b665" })
hi(0, "CmpItemKindOperator", { fg = "#b9cf86" })
hi(0, "CmpItemKindProperty", { fg = "#b9cf86" })
hi(0, "CmpItemKindReference", { fg = "#f288ac" })
hi(0, "CmpItemKindSnippet", { fg = "#956f8b" })
hi(0, "CmpItemKindStruct", { fg = "#dcb541" })
hi(0, "CmpItemKindTypeParameter", { fg = "#b9cf86" })
hi(0, "CmpItemKindUnit", { fg = "#dcb541" })
hi(0, "CmpItemKindValue", { fg = "#f288ac" })
hi(0, "CmpItemKindVariable", { fg = "#f288ac" })
hi(0, "CmpItemMenu", { fg = "#7a5372" })
hi(0, "ColorColumn", { bg = "#15161e" })
hi(0, "Comment", { fg = "#7a5372", italic = true })
hi(0, "Conceal", { fg = "#956f8b" })
hi(0, "Constant", { fg = "#dcb541" })
hi(0, "CurSearch", { link = "IncSearch" })
hi(0, "Cursor", { bg = "#c0caf5", fg = "#23181f" })
hi(0, "CursorColumn", { bg = "#292e42" })
hi(0, "CursorIM", { bg = "#c0caf5", fg = "#23181f" })
hi(0, "CursorLine", { bg = "#292e42" })
hi(0, "CursorLineNr", { fg = "#956f8b" })
hi(0, "DapStoppedLine", { bg = "#2e2a2d" })
hi(0, "DashboardCenter", { fg = "#f288ac" })
hi(0, "DashboardFooter", { fg = "#d3b665", italic = true })
hi(0, "DashboardHeader", { fg = "#01bac8" })
hi(0, "DashboardShortCut", { fg = "#72dbc1" })
hi(0, "DefinitionCount", { fg = "#d26a8f" })
hi(0, "DefinitionIcon", { fg = "#01bac8" })
hi(0, "DiagnosticError", { fg = "#a77c00" })
hi(0, "DiagnosticHint", { fg = "#a1ab3f" })
hi(0, "DiagnosticInfo", { fg = "#5cbd82" })
hi(0, "DiagnosticInformation", { link = "DiagnosticInfo" })
hi(0, "DiagnosticOk", { ctermfg = 10, fg = "#fbce45" })
hi(0, "DiagnosticUnderlineError", { sp = "#db4b4b", undercurl = true })
hi(0, "DiagnosticUnderlineHint", { sp = "#1abc9c", undercurl = true })
hi(0, "DiagnosticUnderlineInfo", { sp = "#0db9d7", undercurl = true })
hi(0, "DiagnosticUnderlineWarn", { sp = "#e0af68", undercurl = true })
hi(0, "DiagnosticVirtualTextError", { bg = "#2d202a", fg = "#a77c00" })
hi(0, "DiagnosticVirtualTextHint", { bg = "#1a2b32", fg = "#a1ab3f" })
hi(0, "DiagnosticVirtualTextInfo", { bg = "#192b38", fg = "#5cbd82" })
hi(0, "DiagnosticVirtualTextWarn", { bg = "#2e2a2d", fg = "#d3b665" })
hi(0, "DiagnosticWarn", { fg = "#d3b665" })
hi(0, "DiagnosticWarning", { link = "DiagnosticWarn" })
hi(0, "DiffAdd", { bg = "#20303b" })
hi(0, "DiffChange", { bg = "#1f2231" })
hi(0, "DiffDelete", { bg = "#37222c" })
hi(0, "DiffText", { bg = "#394b70" })
hi(0, "Directory", { fg = "#01bac8" })
hi(0, "EndOfBuffer", { fg = "#23181f" })
hi(0, "Error", { fg = "#a77c00" })
hi(0, "ErrorMsg", { fg = "#a77c00" })
hi(0, "FernBranchText", { fg = "#01bac8" })
hi(0, "FloatBorder", { bg = "#16161e", fg = "#57a473" })
hi(0, "FoldColumn", { bg = "#1a1b26", fg = "#7a5372" })
hi(0, "Folded", { bg = "#3b4261", fg = "#01bac8" })
hi(0, "Foo", { bg = "#ff007c", fg = "#ca7600" })
hi(0, "Function", { fg = "#01bac8" })
hi(0, "GitGutterAdd", { fg = "#52693e" })
hi(0, "GitGutterChange", { fg = "#197b83" })
hi(0, "GitGutterDelete", { fg = "#9c6c00" })
hi(0, "GitSignsAdd", { fg = "#52693e" })
hi(0, "GitSignsChange", { fg = "#197b83" })
hi(0, "GitSignsDelete", { fg = "#9c6c00" })
hi(0, "GitSignsStagedAdd", { fg = "#28341f" })
hi(0, "GitSignsStagedAddLn", { bg = "#20303b" })
hi(0, "GitSignsStagedAddNr", { fg = "#28341f" })
hi(0, "GitSignsStagedChange", { fg = "#113d41" })
hi(0, "GitSignsStagedChangeLn", { bg = "#1f2231" })
hi(0, "GitSignsStagedChangeNr", { fg = "#113d41" })
hi(0, "GitSignsStagedChangedelete", { fg = "#113d41" })
hi(0, "GitSignsStagedChangedeleteLn", { bg = "#1f2231" })
hi(0, "GitSignsStagedChangedeleteNr", { fg = "#113d41" })
hi(0, "GitSignsStagedDelete", { fg = "#4e3505" })
hi(0, "GitSignsStagedDeleteNr", { fg = "#4e3505" })
hi(0, "GitSignsStagedTopdelete", { fg = "#4e3505" })
hi(0, "GitSignsStagedTopdeleteNr", { fg = "#4e3505" })
hi(0, "GlyphPalette1", { fg = "#a77c00" })
hi(0, "GlyphPalette2", { fg = "#dfb741" })
hi(0, "GlyphPalette3", { fg = "#d3b665" })
hi(0, "GlyphPalette4", { fg = "#01bac8" })
hi(0, "GlyphPalette6", { fg = "#b9cf86" })
hi(0, "GlyphPalette7", { fg = "#e6bedc" })
hi(0, "GlyphPalette9", { fg = "#e29100" })
hi(0, "Hlargs", { fg = "#d3b665" })
hi(0, "HopNextKey", { bold = true, fg = "#ca7600" })
hi(0, "HopNextKey1", { bold = true, fg = "#5cbd82" })
hi(0, "HopNextKey2", { fg = "#397d58" })
hi(0, "HopUnmatched", { fg = "#72526b" })
hi(0, "Identifier", { fg = "#f288ac" })
hi(0, "IlluminatedWordRead", { bg = "#3b4261" })
hi(0, "IlluminatedWordText", { bg = "#3b4261" })
hi(0, "IlluminatedWordWrite", { bg = "#3b4261" })
hi(0, "InactiveWindow", { bg = "#292a33" })
hi(0, "IncSearch", { bg = "#ff9e64", fg = "#1c1419" })
hi(0, "IndentBlanklineChar", { fg = "#563950", nocombine = true })
hi(0, "IndentBlanklineContextChar", { fg = "#d26a8f", nocombine = true })
hi(0, "Italic", { italic = true })
hi(0, "Keyword", { fg = "#72dbc1", italic = true })
hi(0, "LazyProgressDone", { bold = true, fg = "#ca7600" })
hi(0, "LazyProgressTodo", { bold = true, fg = "#563950" })
hi(0, "LeapBackdrop", { fg = "#72526b" })
hi(0, "LeapLabelPrimary", { bold = true, fg = "#ca7600" })
hi(0, "LeapLabelSecondary", { bold = true, fg = "#b9cf86" })
hi(0, "LeapMatch", { bg = "#ff007c", bold = true, fg = "#e6bedc" })
hi(0, "LightspeedGreyWash", { fg = "#72526b" })
hi(0, "LightspeedLabel", { bold = true, fg = "#ca7600", underline = true })
hi(0, "LightspeedLabelDistant", { bold = true, fg = "#b9cf86", underline = true })
hi(0, "LightspeedLabelDistantOverlapped", { fg = "#6ca676", underline = true })
hi(0, "LightspeedLabelOverlapped", { fg = "#ca7600", underline = true })
hi(0, "LightspeedMaskedChar", { fg = "#dcb541" })
hi(0, "LightspeedOneCharMatch", { bg = "#ff007c", bold = true, fg = "#e6bedc" })
hi(0, "LightspeedPendingOpArea", { bg = "#ff007c", fg = "#e6bedc" })
hi(0, "LightspeedShortcut", { bg = "#ff007c", bold = true, fg = "#e6bedc", underline = true })
hi(0, "LightspeedUnlabeledMatch", { bold = true, fg = "#5cbd82" })
hi(0, "LineNr", { fg = "#563950" })
hi(0, "LspCodeLens", { fg = "#7a5372" })
hi(0, "LspFloatWinBorder", { fg = "#57a473" })
hi(0, "LspFloatWinNormal", { bg = "#16161e" })
hi(0, "LspInfoBorder", { bg = "#16161e", fg = "#57a473" })
hi(0, "LspReferenceRead", { bg = "#3b4261" })
hi(0, "LspReferenceText", { bg = "#3b4261" })
hi(0, "LspReferenceWrite", { bg = "#3b4261" })
hi(0, "LspSagaBorderTitle", { fg = "#72dbc1" })
hi(0, "LspSagaCodeActionBorder", { fg = "#01bac8" })
hi(0, "LspSagaCodeActionContent", { fg = "#d26a8f" })
hi(0, "LspSagaCodeActionTitle", { fg = "#6bc689" })
hi(0, "LspSagaDefPreviewBorder", { fg = "#dfb741" })
hi(0, "LspSagaFinderSelection", { fg = "#003e45" })
hi(0, "LspSagaHoverBorder", { fg = "#01bac8" })
hi(0, "LspSagaRenameBorder", { fg = "#dfb741" })
hi(0, "LspSagaSignatureHelpBorder", { fg = "#e29100" })
hi(0, "LspSignatureActiveParameter", { bg = "#20253a", bold = true })
hi(0, "MatchParen", { bold = true, fg = "#dcb541" })
hi(0, "MiniCompletionActiveParameter", { underline = true })
hi(0, "MiniCursorword", { bg = "#3b4261" })
hi(0, "MiniCursorwordCurrent", { bg = "#3b4261" })
hi(0, "MiniIndentscopePrefix", { nocombine = true })
hi(0, "MiniIndentscopeSymbol", { fg = "#6bc689" })
hi(0, "MiniJump", { bg = "#ff007c", fg = "#ffffff" })
hi(0, "MiniJump2dSpot", { bold = true, fg = "#ca7600", nocombine = true })
hi(0, "MiniJump2dSpotAhead", { bg = "#000000", fg = "#808080", nocombine = true })
hi(0, "MiniStarterCurrent", { nocombine = true })
hi(0, "MiniStarterFooter", { fg = "#d3b665", italic = true })
hi(0, "MiniStarterHeader", { fg = "#01bac8" })
hi(0, "MiniStarterInactive", { fg = "#7a5372", italic = true })
hi(0, "MiniStarterItem", { bg = "#1a1b26", fg = "#e6bedc" })
hi(0, "MiniStarterItemBullet", { fg = "#57a473" })
hi(0, "MiniStarterItemPrefix", { fg = "#d3b665" })
hi(0, "MiniStarterQuery", { fg = "#5cbd82" })
hi(0, "MiniStarterSection", { fg = "#6bc689" })
hi(0, "MiniStatuslineDevinfo", { bg = "#292e42", fg = "#caa7c1" })
hi(0, "MiniStatuslineFileinfo", { bg = "#292e42", fg = "#caa7c1" })
hi(0, "MiniStatuslineFilename", { bg = "#3b4261", fg = "#caa7c1" })
hi(0, "MiniStatuslineInactive", { bg = "#16161e", fg = "#01bac8" })
hi(0, "MiniStatuslineModeCommand", { bg = "#e0af68", bold = true, fg = "#1c1419" })
hi(0, "MiniStatuslineModeInsert", { bg = "#9ece6a", bold = true, fg = "#1c1419" })
hi(0, "MiniStatuslineModeNormal", { bg = "#7aa2f7", bold = true, fg = "#1c1419" })
hi(0, "MiniStatuslineModeOther", { bg = "#1abc9c", bold = true, fg = "#1c1419" })
hi(0, "MiniStatuslineModeReplace", { bg = "#f7768e", bold = true, fg = "#1c1419" })
hi(0, "MiniStatuslineModeVisual", { bg = "#bb9af7", bold = true, fg = "#1c1419" })
hi(0, "MiniSurround", { bg = "#ff9e64", fg = "#1c1419" })
hi(0, "MiniTablineCurrent", { bg = "#3b4261", fg = "#e6bedc" })
hi(0, "MiniTablineFill", { bg = "#15161e" })
hi(0, "MiniTablineHidden", { bg = "#16161e", fg = "#956f8b" })
hi(0, "MiniTablineModifiedCurrent", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "MiniTablineModifiedHidden", { bg = "#16161e", fg = "#9b8852" })
hi(0, "MiniTablineModifiedVisible", { bg = "#16161e", fg = "#d3b665" })
hi(0, "MiniTablineTabpagesection", { bg = "#16161e" })
hi(0, "MiniTablineVisible", { bg = "#16161e", fg = "#e6bedc" })
hi(0, "MiniTestEmphasis", { bold = true })
hi(0, "MiniTestFail", { bold = true, fg = "#e29100" })
hi(0, "MiniTestPass", { bold = true, fg = "#dfb741" })
hi(0, "MiniTrailspace", { bg = "#f7768e" })
hi(0, "ModeMsg", { bold = true, fg = "#caa7c1" })
hi(0, "MoreMsg", { fg = "#01bac8" })
hi(0, "MsgArea", { fg = "#caa7c1" })
hi(0, "NavicIconsArray", { fg = "#dcb541" })
hi(0, "NavicIconsBoolean", { fg = "#dcb541" })
hi(0, "NavicIconsClass", { fg = "#dcb541" })
hi(0, "NavicIconsConstant", { fg = "#f288ac" })
hi(0, "NavicIconsConstructor", { fg = "#dcb541" })
hi(0, "NavicIconsEnum", { fg = "#dcb541" })
hi(0, "NavicIconsEnumMember", { fg = "#b9cf86" })
hi(0, "NavicIconsEvent", { fg = "#dcb541" })
hi(0, "NavicIconsField", { fg = "#b9cf86" })
hi(0, "NavicIconsFile", { fg = "#e6bedc" })
hi(0, "NavicIconsFunction", { fg = "#01bac8" })
hi(0, "NavicIconsInterface", { fg = "#dcb541" })
hi(0, "NavicIconsKey", { fg = "#d26a8f" })
hi(0, "NavicIconsKeyword", { fg = "#d26a8f" })
hi(0, "NavicIconsMethod", { fg = "#01bac8" })
hi(0, "NavicIconsModule", { fg = "#d3b665" })
hi(0, "NavicIconsNamespace", { fg = "#e6bedc" })
hi(0, "NavicIconsNull", { fg = "#dcb541" })
hi(0, "NavicIconsNumber", { fg = "#dcb541" })
hi(0, "NavicIconsObject", { fg = "#dcb541" })
hi(0, "NavicIconsOperator", { fg = "#e6bedc" })
hi(0, "NavicIconsPackage", { fg = "#e6bedc" })
hi(0, "NavicIconsProperty", { fg = "#b9cf86" })
hi(0, "NavicIconsString", { fg = "#dfb741" })
hi(0, "NavicIconsStruct", { fg = "#dcb541" })
hi(0, "NavicIconsTypeParameter", { fg = "#b9cf86" })
hi(0, "NavicIconsVariable", { fg = "#f288ac" })
hi(0, "NavicSeparator", { fg = "#e6bedc" })
hi(0, "NavicText", { fg = "#e6bedc" })
hi(0, "NeoTreeDimText", { fg = "#563950" })
hi(0, "NeoTreeNormal", { bg = "#16161e", fg = "#caa7c1" })
hi(0, "NeoTreeNormalNC", { bg = "#16161e", fg = "#caa7c1" })
hi(0, "NeogitBranch", { fg = "#f288ac" })
hi(0, "NeogitDiffAddHighlight", { bg = "#20303b", fg = "#689d72" })
hi(0, "NeogitDiffContextHighlight", { bg = "#2b2f44", fg = "#caa7c1" })
hi(0, "NeogitDiffDeleteHighlight", { bg = "#37222c", fg = "#835b1d" })
hi(0, "NeogitHunkHeader", { bg = "#292e42", fg = "#e6bedc" })
hi(0, "NeogitHunkHeaderHighlight", { bg = "#3b4261", fg = "#01bac8" })
hi(0, "NeogitRemote", { fg = "#d26a8f" })
hi(0, "NeotestAdapterName", { bold = true, fg = "#d26a8f" })
hi(0, "NeotestBorder", { fg = "#01bac8" })
hi(0, "NeotestDir", { fg = "#01bac8" })
hi(0, "NeotestExpandMarker", { fg = "#caa7c1" })
hi(0, "NeotestFailed", { fg = "#e29100" })
hi(0, "NeotestFile", { fg = "#a1ab3f" })
hi(0, "NeotestFocused", { fg = "#d3b665" })
hi(0, "NeotestIndent", { fg = "#caa7c1" })
hi(0, "NeotestMarked", { fg = "#01bac8" })
hi(0, "NeotestNamespace", { fg = "#6ca676" })
hi(0, "NeotestPassed", { fg = "#dfb741" })
hi(0, "NeotestRunning", { fg = "#d3b665" })
hi(0, "NeotestSkipped", { fg = "#01bac8" })
hi(0, "NeotestTarget", { fg = "#01bac8" })
hi(0, "NeotestTest", { fg = "#caa7c1" })
hi(0, "NeotestWinSelect", { fg = "#01bac8" })
hi(0, "NoiceCompletionItemKindClass", { fg = "#dcb541" })
hi(0, "NoiceCompletionItemKindConstant", { fg = "#f288ac" })
hi(0, "NoiceCompletionItemKindConstructor", { fg = "#01bac8" })
hi(0, "NoiceCompletionItemKindDefault", { fg = "#caa7c1" })
hi(0, "NoiceCompletionItemKindEnum", { fg = "#dcb541" })
hi(0, "NoiceCompletionItemKindEnumMember", { fg = "#b9cf86" })
hi(0, "NoiceCompletionItemKindEvent", { fg = "#dcb541" })
hi(0, "NoiceCompletionItemKindField", { fg = "#b9cf86" })
hi(0, "NoiceCompletionItemKindFunction", { fg = "#01bac8" })
hi(0, "NoiceCompletionItemKindInterface", { fg = "#dcb541" })
hi(0, "NoiceCompletionItemKindKeyword", { fg = "#72dbc1" })
hi(0, "NoiceCompletionItemKindMethod", { fg = "#01bac8" })
hi(0, "NoiceCompletionItemKindModule", { fg = "#d3b665" })
hi(0, "NoiceCompletionItemKindOperator", { fg = "#b9cf86" })
hi(0, "NoiceCompletionItemKindProperty", { fg = "#b9cf86" })
hi(0, "NoiceCompletionItemKindReference", { fg = "#f288ac" })
hi(0, "NoiceCompletionItemKindSnippet", { fg = "#956f8b" })
hi(0, "NoiceCompletionItemKindStruct", { fg = "#dcb541" })
hi(0, "NoiceCompletionItemKindTypeParameter", { fg = "#b9cf86" })
hi(0, "NoiceCompletionItemKindUnit", { fg = "#dcb541" })
hi(0, "NoiceCompletionItemKindValue", { fg = "#f288ac" })
hi(0, "NoiceCompletionItemKindVariable", { fg = "#f288ac" })
hi(0, "NonText", { fg = "#72526b" })
hi(0, "Normal", { bg = "#1a1b26", fg = "#e6bedc" })
hi(0, "NormalFloat", { bg = "#16161e", fg = "#e6bedc" })
hi(0, "NormalNC", { bg = "#1a1b26", fg = "#e6bedc" })
hi(0, "NormalSB", { bg = "#16161e", fg = "#caa7c1" })
hi(0, "NotifyDEBUGBody", { bg = "#1a1b26", fg = "#e6bedc" })
hi(0, "NotifyDEBUGBorder", { bg = "#1a1b26", fg = "#3d2938" })
hi(0, "NotifyDEBUGIcon", { fg = "#7a5372" })
hi(0, "NotifyDEBUGTitle", { fg = "#7a5372" })
hi(0, "NotifyERRORBody", { bg = "#1a1b26", fg = "#e6bedc" })
hi(0, "NotifyERRORBorder", { bg = "#1a1b26", fg = "#4d310d" })
hi(0, "NotifyERRORIcon", { fg = "#a77c00" })
hi(0, "NotifyERRORTitle", { fg = "#a77c00" })
hi(0, "NotifyINFOBody", { bg = "#1a1b26", fg = "#e6bedc" })
hi(0, "NotifyINFOBorder", { bg = "#1a1b26", fg = "#1f4d3a" })
hi(0, "NotifyINFOIcon", { fg = "#5cbd82" })
hi(0, "NotifyINFOTitle", { fg = "#5cbd82" })
hi(0, "NotifyTRACEBody", { bg = "#1a1b26", fg = "#e6bedc" })
hi(0, "NotifyTRACEBorder", { bg = "#1a1b26", fg = "#573140" })
hi(0, "NotifyTRACEIcon", { fg = "#d26a8f" })
hi(0, "NotifyTRACETitle", { fg = "#d26a8f" })
hi(0, "NotifyWARNBody", { bg = "#1a1b26", fg = "#e6bedc" })
hi(0, "NotifyWARNBorder", { bg = "#1a1b26", fg = "#504938" })
hi(0, "NotifyWARNIcon", { fg = "#d3b665" })
hi(0, "NotifyWARNTitle", { fg = "#d3b665" })
hi(0, "NvimInternalError", { bg = "#ff0000", ctermbg = 9, ctermfg = 9, fg = "#a78300" })
hi(0, "NvimTreeFolderIcon", { fg = "#01bac8" })
hi(0, "NvimTreeGitDeleted", { fg = "#835b1d" })
hi(0, "NvimTreeGitDirty", { fg = "#259399" })
hi(0, "NvimTreeGitNew", { fg = "#689d72" })
hi(0, "NvimTreeImageFile", { fg = "#caa7c1" })
hi(0, "NvimTreeIndentMarker", { fg = "#563950" })
hi(0, "NvimTreeNormal", { bg = "#16161e", fg = "#caa7c1" })
hi(0, "NvimTreeNormalNC", { bg = "#16161e", fg = "#caa7c1" })
hi(0, "NvimTreeOpenedFile", { bg = "#292e42" })
hi(0, "NvimTreeRootFolder", { bold = true, fg = "#01bac8" })
hi(0, "NvimTreeSpecialFile", { fg = "#d26a8f", underline = true })
hi(0, "NvimTreeSymlink", { fg = "#01bac8" })
hi(0, "NvimTreeWinSeparator", { bg = "#16161e", fg = "#1c1419" })
hi(0, "Operator", { fg = "#92e4c1" })
hi(0, "Pmenu", { bg = "#16161e", fg = "#e6bedc" })
hi(0, "PmenuSbar", { bg = "#222229" })
hi(0, "PmenuSel", { bg = "#343a55" })
hi(0, "PmenuThumb", { bg = "#3b4261" })
hi(0, "PreProc", { fg = "#72dbc1" })
hi(0, "Question", { fg = "#01bac8" })
hi(0, "QuickFixLine", { bg = "#283457", bold = true })
hi(0, "ReferencesCount", { fg = "#d26a8f" })
hi(0, "ReferencesIcon", { fg = "#01bac8" })
hi(0, "ScrollbarError", { fg = "#a77c00" })
hi(0, "ScrollbarErrorHandle", { bg = "#292e42", fg = "#a77c00" })
hi(0, "ScrollbarHandle", { bg = "#292e42" })
hi(0, "ScrollbarHint", { fg = "#a1ab3f" })
hi(0, "ScrollbarHintHandle", { bg = "#292e42", fg = "#a1ab3f" })
hi(0, "ScrollbarInfo", { fg = "#5cbd82" })
hi(0, "ScrollbarInfoHandle", { bg = "#292e42", fg = "#5cbd82" })
hi(0, "ScrollbarMisc", { fg = "#d26a8f" })
hi(0, "ScrollbarMiscHandle", { bg = "#292e42", fg = "#d26a8f" })
hi(0, "ScrollbarSearch", { fg = "#dcb541" })
hi(0, "ScrollbarSearchHandle", { bg = "#292e42", fg = "#dcb541" })
hi(0, "ScrollbarWarn", { fg = "#d3b665" })
hi(0, "ScrollbarWarnHandle", { bg = "#292e42", fg = "#d3b665" })
hi(0, "Search", { bg = "#3d59a1", fg = "#e6bedc" })
hi(0, "SignColumn", { bg = "#1a1b26", fg = "#563950" })
hi(0, "SignColumnSB", { bg = "#16161e", fg = "#563950" })
hi(0, "Sneak", { bg = "#bb9af7", fg = "#3b2837" })
hi(0, "SneakScope", { bg = "#283457" })
hi(0, "Special", { fg = "#6bc689" })
hi(0, "SpecialKey", { fg = "#72526b" })
hi(0, "SpellBad", { sp = "#db4b4b", undercurl = true })
hi(0, "SpellCap", { sp = "#e0af68", undercurl = true })
hi(0, "SpellLocal", { sp = "#0db9d7", undercurl = true })
hi(0, "SpellRare", { sp = "#1abc9c", undercurl = true })
hi(0, "Statement", { fg = "#f288ac" })
hi(0, "StatusLine", { bg = "#16161e", fg = "#caa7c1" })
hi(0, "StatusLineNC", { bg = "#16161e", fg = "#563950" })
hi(0, "String", { fg = "#dfb741" })
hi(0, "Substitute", { bg = "#f7768e", fg = "#1c1419" })
hi(0, "TSNodeKey", { bold = true, fg = "#ca7600" })
hi(0, "TSNodeUnmatched", { fg = "#72526b" })
hi(0, "TSRainbowBlue", { fg = "#01bac8" })
hi(0, "TSRainbowCyan", { fg = "#72dbc1" })
hi(0, "TSRainbowGreen", { fg = "#dfb741" })
hi(0, "TSRainbowOrange", { fg = "#dcb541" })
hi(0, "TSRainbowRed", { fg = "#e29100" })
hi(0, "TSRainbowViolet", { fg = "#d26a8f" })
hi(0, "TSRainbowYellow", { fg = "#d3b665" })
hi(0, "TabLine", { bg = "#16161e", fg = "#563950" })
hi(0, "TabLineFill", { bg = "#15161e" })
hi(0, "TabLineSel", { bg = "#7aa2f7", fg = "#1c1419" })
hi(0, "TargetWord", { fg = "#72dbc1" })
hi(0, "TelescopeBorder", { bg = "#16161e", fg = "#57a473" })
hi(0, "TelescopeNormal", { bg = "#16161e", fg = "#e6bedc" })
hi(0, "Title", { bold = true, fg = "#01bac8" })
hi(0, "Todo", { bg = "#e0af68", fg = "#23181f" })
hi(0, "TreesitterContext", { bg = "#343a55" })
hi(0, "TroubleCount", { bg = "#3b4261", fg = "#f288ac" })
hi(0, "TroubleNormal", { bg = "#16161e", fg = "#caa7c1" })
hi(0, "TroubleText", { fg = "#caa7c1" })
hi(0, "Type", { fg = "#6bc689" })
hi(0, "Underlined", { underline = true })
hi(0, "VertSplit", { fg = "#1c1419" })
hi(0, "Visual", { bg = "#283457" })
hi(0, "VisualNOS", { bg = "#283457" })
hi(0, "WarningMsg", { fg = "#d3b665" })
hi(0, "WhichKey", { fg = "#72dbc1" })
hi(0, "WhichKeyDesc", { fg = "#f288ac" })
hi(0, "WhichKeyFloat", { bg = "#16161e" })
hi(0, "WhichKeyGroup", { fg = "#01bac8" })
hi(0, "WhichKeySeparator", { fg = "#7a5372" })
hi(0, "WhichKeySeperator", { fg = "#7a5372" })
hi(0, "WhichKeyValue", { fg = "#956f8b" })
hi(0, "Whitespace", { fg = "#563950" })
hi(0, "WildMenu", { bg = "#283457" })
hi(0, "WinSeparator", { bold = true, fg = "#1c1419" })
hi(0, "YankyPut", { link = "IncSearch" })
hi(0, "YankyYanked", { link = "IncSearch" })
hi(0, "debugBreakpoint", { bg = "#192b38", fg = "#5cbd82" })
hi(0, "debugPC", { bg = "#16161e" })
hi(0, "diffAdded", { fg = "#689d72" })
hi(0, "diffChanged", { fg = "#259399" })
hi(0, "diffFile", { fg = "#01bac8" })
hi(0, "diffIndexLine", { fg = "#f288ac" })
hi(0, "diffLine", { fg = "#7a5372" })
hi(0, "diffNewFile", { fg = "#dcb541" })
hi(0, "diffOldFile", { fg = "#d3b665" })
hi(0, "diffRemoved", { fg = "#835b1d" })
hi(0, "healthError", { fg = "#a77c00" })
hi(0, "healthSuccess", { fg = "#b9cf86" })
hi(0, "healthWarning", { fg = "#d3b665" })
hi(0, "helpCommand", { bg = "#414868", fg = "#01bac8" })
hi(0, "htmlH1", { bold = true, fg = "#f288ac" })
hi(0, "htmlH2", { bold = true, fg = "#01bac8" })
hi(0, "illuminatedCurWord", { bg = "#3b4261" })
hi(0, "illuminatedWord", { bg = "#3b4261" })
hi(0, "lCursor", { bg = "#c0caf5", fg = "#23181f" })
hi(0, "lualine_a_command", { bg = "#e0af68", fg = "#1c1419" })
hi(0, "lualine_a_inactive", { bg = "#16161e", fg = "#01bac8" })
hi(0, "lualine_a_insert", { bg = "#9ece6a", fg = "#1c1419" })
hi(0, "lualine_a_normal", { bg = "#7aa2f7", fg = "#1c1419" })
hi(0, "lualine_a_replace", { bg = "#f7768e", fg = "#1c1419" })
hi(0, "lualine_a_terminal", { bg = "#73daca", fg = "#1c1419" })
hi(0, "lualine_a_visual", { bg = "#bb9af7", fg = "#1c1419" })
hi(0, "lualine_b_command", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "lualine_b_diagnostics_error_command", { bg = "#3b4261", fg = "#a77c00" })
hi(0, "lualine_b_diagnostics_error_inactive", { bg = "#16161e", fg = "#a77c00" })
hi(0, "lualine_b_diagnostics_error_insert", { bg = "#3b4261", fg = "#a77c00" })
hi(0, "lualine_b_diagnostics_error_normal", { bg = "#3b4261", fg = "#a77c00" })
hi(0, "lualine_b_diagnostics_error_replace", { bg = "#3b4261", fg = "#a77c00" })
hi(0, "lualine_b_diagnostics_error_terminal", { bg = "#3b4261", fg = "#a77c00" })
hi(0, "lualine_b_diagnostics_error_visual", { bg = "#3b4261", fg = "#a77c00" })
hi(0, "lualine_b_diagnostics_hint_command", { bg = "#3b4261", fg = "#a1ab3f" })
hi(0, "lualine_b_diagnostics_hint_inactive", { bg = "#16161e", fg = "#a1ab3f" })
hi(0, "lualine_b_diagnostics_hint_insert", { bg = "#3b4261", fg = "#a1ab3f" })
hi(0, "lualine_b_diagnostics_hint_normal", { bg = "#3b4261", fg = "#a1ab3f" })
hi(0, "lualine_b_diagnostics_hint_replace", { bg = "#3b4261", fg = "#a1ab3f" })
hi(0, "lualine_b_diagnostics_hint_terminal", { bg = "#3b4261", fg = "#a1ab3f" })
hi(0, "lualine_b_diagnostics_hint_visual", { bg = "#3b4261", fg = "#a1ab3f" })
hi(0, "lualine_b_diagnostics_info_command", { bg = "#3b4261", fg = "#5cbd82" })
hi(0, "lualine_b_diagnostics_info_inactive", { bg = "#16161e", fg = "#5cbd82" })
hi(0, "lualine_b_diagnostics_info_insert", { bg = "#3b4261", fg = "#5cbd82" })
hi(0, "lualine_b_diagnostics_info_normal", { bg = "#3b4261", fg = "#5cbd82" })
hi(0, "lualine_b_diagnostics_info_replace", { bg = "#3b4261", fg = "#5cbd82" })
hi(0, "lualine_b_diagnostics_info_terminal", { bg = "#3b4261", fg = "#5cbd82" })
hi(0, "lualine_b_diagnostics_info_visual", { bg = "#3b4261", fg = "#5cbd82" })
hi(0, "lualine_b_diagnostics_warn_command", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "lualine_b_diagnostics_warn_inactive", { bg = "#16161e", fg = "#d3b665" })
hi(0, "lualine_b_diagnostics_warn_insert", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "lualine_b_diagnostics_warn_normal", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "lualine_b_diagnostics_warn_replace", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "lualine_b_diagnostics_warn_terminal", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "lualine_b_diagnostics_warn_visual", { bg = "#3b4261", fg = "#d3b665" })
hi(0, "lualine_b_diff_added_command", { bg = "#3b4261", fg = "#52693e" })
hi(0, "lualine_b_diff_added_inactive", { bg = "#16161e", fg = "#52693e" })
hi(0, "lualine_b_diff_added_insert", { bg = "#3b4261", fg = "#52693e" })
hi(0, "lualine_b_diff_added_normal", { bg = "#3b4261", fg = "#52693e" })
hi(0, "lualine_b_diff_added_replace", { bg = "#3b4261", fg = "#52693e" })
hi(0, "lualine_b_diff_added_terminal", { bg = "#3b4261", fg = "#52693e" })
hi(0, "lualine_b_diff_added_visual", { bg = "#3b4261", fg = "#52693e" })
hi(0, "lualine_b_diff_modified_command", { bg = "#3b4261", fg = "#197b83" })
hi(0, "lualine_b_diff_modified_inactive", { bg = "#16161e", fg = "#197b83" })
hi(0, "lualine_b_diff_modified_insert", { bg = "#3b4261", fg = "#197b83" })
hi(0, "lualine_b_diff_modified_normal", { bg = "#3b4261", fg = "#197b83" })
hi(0, "lualine_b_diff_modified_replace", { bg = "#3b4261", fg = "#197b83" })
hi(0, "lualine_b_diff_modified_terminal", { bg = "#3b4261", fg = "#197b83" })
hi(0, "lualine_b_diff_modified_visual", { bg = "#3b4261", fg = "#197b83" })
hi(0, "lualine_b_diff_removed_command", { bg = "#3b4261", fg = "#9c6c00" })
hi(0, "lualine_b_diff_removed_inactive", { bg = "#16161e", fg = "#9c6c00" })
hi(0, "lualine_b_diff_removed_insert", { bg = "#3b4261", fg = "#9c6c00" })
hi(0, "lualine_b_diff_removed_normal", { bg = "#3b4261", fg = "#9c6c00" })
hi(0, "lualine_b_diff_removed_replace", { bg = "#3b4261", fg = "#9c6c00" })
hi(0, "lualine_b_diff_removed_terminal", { bg = "#3b4261", fg = "#9c6c00" })
hi(0, "lualine_b_diff_removed_visual", { bg = "#3b4261", fg = "#9c6c00" })
hi(0, "lualine_b_inactive", { bg = "#16161e", bold = true, fg = "#563950" })
hi(0, "lualine_b_insert", { bg = "#3b4261", fg = "#dfb741" })
hi(0, "lualine_b_normal", { bg = "#3b4261", fg = "#01bac8" })
hi(0, "lualine_b_replace", { bg = "#3b4261", fg = "#e29100" })
hi(0, "lualine_b_terminal", { bg = "#3b4261", fg = "#b9cf86" })
hi(0, "lualine_b_visual", { bg = "#3b4261", fg = "#f288ac" })
hi(0, "lualine_c_inactive", { bg = "#16161e", fg = "#563950" })
hi(0, "lualine_c_normal", { bg = "#16161e", fg = "#caa7c1" })
hi(0, "markdownCode", { fg = "#a1ab3f" })
hi(0, "markdownCodeBlock", { fg = "#a1ab3f" })
hi(0, "markdownH1", { bold = true, fg = "#f288ac" })
hi(0, "markdownH2", { bold = true, fg = "#01bac8" })
hi(0, "markdownHeadingDelimiter", { bold = true, fg = "#dcb541" })
hi(0, "markdownLinkText", { fg = "#01bac8", underline = true })
hi(0, "mkdCodeDelimiter", { bg = "#414868", fg = "#e6bedc" })
hi(0, "mkdCodeEnd", { bold = true, fg = "#a1ab3f" })
hi(0, "mkdCodeStart", { bold = true, fg = "#a1ab3f" })
hi(0, "qfFileName", { fg = "#01bac8" })
hi(0, "qfLineNr", { fg = "#956f8b" })
hi(0, "rainbowcol1", { fg = "#e29100" })
hi(0, "rainbowcol2", { fg = "#d3b665" })
hi(0, "rainbowcol3", { fg = "#dfb741" })
hi(0, "rainbowcol4", { fg = "#a1ab3f" })
hi(0, "rainbowcol5", { fg = "#01bac8" })
hi(0, "rainbowcol6", { fg = "#f288ac" })
hi(0, "rainbowcol7", { fg = "#d26a8f" })

-- Terminal colors
local g = vim.g

g.terminal_color_0 = "#15161e"
g.terminal_color_1 = "#f7768e"
g.terminal_color_2 = "#9ece6a"
g.terminal_color_3 = "#e0af68"
g.terminal_color_4 = "#7aa2f7"
g.terminal_color_5 = "#bb9af7"
g.terminal_color_6 = "#7dcfff"
g.terminal_color_7 = "#a9b1d6"
g.terminal_color_8 = "#414868"
g.terminal_color_9 = "#f7768e"
g.terminal_color_10 = "#9ece6a"
g.terminal_color_11 = "#e0af68"
g.terminal_color_12 = "#7aa2f7"
g.terminal_color_13 = "#bb9af7"
g.terminal_color_14 = "#7dcfff"
g.terminal_color_15 = "#c0caf5"
