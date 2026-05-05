local M = {}

function M.setup(p)
  local hl = vim.api.nvim_set_hl

  -- =============================================
  -- Editor
  -- =============================================
  hl(0, "Normal", { fg = p.fg0, bg = p.bg0 })
  hl(0, "NormalFloat", { fg = p.fg0, bg = p.bg1 })
  hl(0, "NormalNC", { fg = p.fg0, bg = p.bg0 })
  hl(0, "FloatBorder", { fg = p.bg4, bg = p.bg1 })
  hl(0, "FloatTitle", { fg = p.bright_orange, bg = p.bg1, bold = true })
  hl(0, "Cursor", { fg = p.bg0, bg = p.fg0 })
  hl(0, "lCursor", { link = "Cursor" })
  hl(0, "CursorIM", { link = "Cursor" })
  hl(0, "CursorLine", { bg = p.bg1 })
  hl(0, "CursorColumn", { link = "CursorLine" })
  hl(0, "ColorColumn", { bg = p.bg1 })
  hl(0, "Conceal", { fg = p.bright_blue })
  hl(0, "Visual", { bg = p.bg3 })
  hl(0, "VisualNOS", { link = "Visual" })
  hl(0, "Search", { fg = p.bg0, bg = p.bright_yellow })
  hl(0, "IncSearch", { fg = p.bg0, bg = p.bright_orange })
  hl(0, "CurSearch", { fg = p.bg0, bg = p.bright_orange })
  hl(0, "Substitute", { fg = p.bg0, bg = p.bright_red })
  hl(0, "LineNr", { fg = p.bg4 })
  hl(0, "CursorLineNr", { fg = p.bright_yellow, bold = true })
  hl(0, "SignColumn", { fg = p.bg4, bg = p.bg0 })
  hl(0, "FoldColumn", { fg = p.bg4, bg = p.bg0 })
  hl(0, "Folded", { fg = p.fg4, bg = p.bg1 })
  hl(0, "VertSplit", { fg = p.bg3, bg = p.bg0 })
  hl(0, "WinSeparator", { fg = p.bg3, bg = p.bg0 })
  hl(0, "MsgArea", { fg = p.fg1, bg = p.bg0 })
  hl(0, "MsgSeparator", { fg = p.bg4, bg = p.bg0 })
  hl(0, "ModeMsg", { fg = p.bright_yellow, bold = true })
  hl(0, "MoreMsg", { fg = p.bright_yellow, bold = true })
  hl(0, "WarningMsg", { fg = p.bright_red, bold = true })
  hl(0, "ErrorMsg", { fg = p.bright_red, bg = p.bg0, bold = true })
  hl(0, "Question", { fg = p.bright_orange, bold = true })
  hl(0, "Title", { fg = p.bright_green, bold = true })
  hl(0, "Directory", { fg = p.bright_green, bold = true })
  hl(0, "MatchParen", { fg = p.none, bg = p.bg3, bold = true })
  hl(0, "NonText", { fg = p.bg3 })
  hl(0, "SpecialKey", { fg = p.bg3 })
  hl(0, "Whitespace", { fg = p.bg3 })
  hl(0, "EndOfBuffer", { fg = p.bg0 })
  hl(0, "WildMenu", { fg = p.bg0, bg = p.bright_blue })
  hl(0, "QuickFixLine", { fg = p.bright_purple, bold = true })
  hl(0, "TermCursor", { link = "Cursor" })
  hl(0, "WinBar", { fg = p.fg1, bg = p.bg0, bold = true })
  hl(0, "WinBarNC", { fg = p.fg4, bg = p.bg0 })

  -- =============================================
  -- Pmenu (completion)
  -- =============================================
  hl(0, "Pmenu", { fg = p.fg1, bg = p.bg2 })
  hl(0, "PmenuSel", { fg = p.bg0, bg = p.bright_blue })
  hl(0, "PmenuSbar", { bg = p.bg2 })
  hl(0, "PmenuThumb", { bg = p.bg4 })

  -- =============================================
  -- Tabline
  -- =============================================
  hl(0, "TabLine", { fg = p.fg4, bg = p.bg2 })
  hl(0, "TabLineFill", { bg = p.bg1 })
  hl(0, "TabLineSel", { fg = p.fg0, bg = p.bg0, bold = true })

  -- =============================================
  -- Statusline
  -- =============================================
  hl(0, "StatusLine", { fg = p.fg1, bg = p.bg2 })
  hl(0, "StatusLineNC", { fg = p.fg4, bg = p.bg1 })

  -- =============================================
  -- Diff
  -- =============================================
  hl(0, "DiffAdd", { fg = p.none, bg = "#1a2a1a" })
  hl(0, "DiffChange", { fg = p.none, bg = "#1a1f2a" })
  hl(0, "DiffDelete", { fg = p.none, bg = "#2a1a1a" })
  hl(0, "DiffText", { fg = p.none, bg = "#2a3040" })

  -- =============================================
  -- Spell
  -- =============================================
  hl(0, "SpellBad", { sp = p.bright_red, undercurl = true })
  hl(0, "SpellCap", { sp = p.bright_blue, undercurl = true })
  hl(0, "SpellLocal", { sp = p.bright_aqua, undercurl = true })
  hl(0, "SpellRare", { sp = p.bright_purple, undercurl = true })

  -- =============================================
  -- Syntax
  -- =============================================
  hl(0, "Comment", { fg = p.fg4, italic = true })
  hl(0, "Constant", { fg = p.bright_purple })
  hl(0, "String", { fg = p.bright_green })
  hl(0, "Character", { fg = p.bright_purple })
  hl(0, "Number", { fg = p.bright_purple })
  hl(0, "Boolean", { fg = p.bright_purple })
  hl(0, "Float", { fg = p.bright_purple })
  hl(0, "Identifier", { fg = p.bright_blue })
  hl(0, "Function", { fg = p.bright_blue, bold = true })
  hl(0, "Statement", { fg = p.bright_purple })
  hl(0, "Conditional", { fg = p.bright_purple })
  hl(0, "Repeat", { fg = p.bright_purple })
  hl(0, "Label", { fg = p.bright_aqua })
  hl(0, "Operator", { fg = p.bright_aqua })
  hl(0, "Keyword", { fg = p.bright_purple })
  hl(0, "Exception", { fg = p.bright_purple })
  hl(0, "PreProc", { fg = p.bright_aqua })
  hl(0, "Include", { fg = p.bright_pink })
  hl(0, "Define", { fg = p.bright_aqua })
  hl(0, "Macro", { fg = p.bright_aqua })
  hl(0, "PreCondit", { fg = p.bright_aqua })
  hl(0, "Type", { fg = p.bright_aqua })
  hl(0, "StorageClass", { fg = p.bright_purple })
  hl(0, "Structure", { fg = p.bright_aqua })
  hl(0, "Typedef", { fg = p.bright_aqua })
  hl(0, "Special", { fg = p.bright_green })
  hl(0, "SpecialChar", { fg = p.bright_orange })
  hl(0, "Tag", { fg = p.bright_aqua })
  hl(0, "Delimiter", { fg = p.fg2 })
  hl(0, "SpecialComment", { fg = p.fg4, bold = true })
  hl(0, "Debug", { fg = p.bright_purple })
  hl(0, "Underlined", { fg = p.bright_blue, underline = true })
  hl(0, "Ignore", {})
  hl(0, "Error", { fg = p.bright_red, bold = true })
  hl(0, "Todo", { fg = p.bright_green, bg = p.bg2, bold = true, italic = true })

  -- =============================================
  -- Treesitter
  -- =============================================
  hl(0, "@variable", { fg = p.fg0 })
  hl(0, "@variable.builtin", { fg = p.bright_blue, italic = true })
  hl(0, "@variable.parameter", { fg = p.fg0 })
  hl(0, "@variable.member", { fg = p.bright_blue })
  hl(0, "@constant", { fg = p.bright_purple })
  hl(0, "@constant.builtin", { fg = p.bright_purple, bold = true })
  hl(0, "@constant.macro", { fg = p.bright_purple })
  hl(0, "@module", { fg = p.bright_aqua })
  hl(0, "@label", { fg = p.bright_aqua })
  hl(0, "@string", { fg = p.bright_green })
  hl(0, "@string.documentation", { fg = p.fg4, italic = true })
  hl(0, "@string.escape", { fg = p.bright_orange })
  hl(0, "@string.special", { fg = p.bright_orange })
  hl(0, "@string.regex", { fg = p.bright_orange })
  hl(0, "@character", { fg = p.bright_purple })
  hl(0, "@boolean", { fg = p.bright_purple })
  hl(0, "@number", { fg = p.bright_purple })
  hl(0, "@number.float", { fg = p.bright_purple })
  hl(0, "@type", { fg = p.bright_aqua })
  hl(0, "@type.builtin", { fg = p.bright_aqua, italic = true })
  hl(0, "@type.definition", { fg = p.bright_aqua })
  hl(0, "@attribute", { fg = p.bright_green })
  hl(0, "@property", { fg = p.bright_blue })
  hl(0, "@function", { fg = p.bright_blue, bold = true })
  hl(0, "@function.builtin", { fg = p.bright_blue, bold = true })
  hl(0, "@function.call", { fg = p.bright_blue })
  hl(0, "@function.macro", { fg = p.bright_aqua })
  hl(0, "@function.method", { fg = p.bright_blue })
  hl(0, "@function.method.call", { fg = p.bright_blue })
  hl(0, "@constructor", { fg = p.bright_aqua })
  hl(0, "@operator", { fg = p.bright_aqua })
  hl(0, "@keyword", { fg = p.bright_purple })
  hl(0, "@keyword.coroutine", { fg = p.bright_purple, italic = true })
  hl(0, "@keyword.function", { fg = p.bright_purple })
  hl(0, "@keyword.operator", { fg = p.bright_aqua })
  hl(0, "@keyword.import", { fg = p.bright_pink })
  hl(0, "@keyword.return", { fg = p.bright_purple })
  hl(0, "@keyword.exception", { fg = p.bright_purple })
  hl(0, "@keyword.conditional", { fg = p.bright_purple })
  hl(0, "@keyword.repeat", { fg = p.bright_purple })
  hl(0, "@punctuation.delimiter", { fg = p.fg2 })
  hl(0, "@punctuation.bracket", { fg = p.fg2 })
  hl(0, "@punctuation.special", { fg = p.bright_aqua })
  hl(0, "@comment", { fg = p.fg4, italic = true })
  hl(0, "@comment.documentation", { fg = p.fg4, italic = true })
  hl(0, "@comment.error", { fg = p.bright_red, bold = true })
  hl(0, "@comment.warning", { fg = p.bright_yellow, bold = true })
  hl(0, "@comment.todo", { fg = p.bright_green, bold = true, italic = true })
  hl(0, "@comment.note", { fg = p.bright_blue, bold = true })
  hl(0, "@markup.heading", { fg = p.bright_green, bold = true })
  hl(0, "@markup.heading.1", { fg = p.bright_green, bold = true })
  hl(0, "@markup.heading.2", { fg = p.bright_aqua, bold = true })
  hl(0, "@markup.heading.3", { fg = p.bright_purple, bold = true })
  hl(0, "@markup.heading.4", { fg = p.bright_blue, bold = true })
  hl(0, "@markup.heading.5", { fg = p.bright_green, bold = true })
  hl(0, "@markup.heading.6", { fg = p.bright_aqua, bold = true })
  hl(0, "@markup.strong", { bold = true })
  hl(0, "@markup.italic", { italic = true })
  hl(0, "@markup.strikethrough", { strikethrough = true })
  hl(0, "@markup.underline", { underline = true })
  hl(0, "@markup.raw", { fg = p.bright_aqua })
  hl(0, "@markup.link", { fg = p.bright_blue, underline = true })
  hl(0, "@markup.link.url", { fg = p.bright_purple, underline = true })
  hl(0, "@markup.link.label", { fg = p.bright_blue })
  hl(0, "@markup.list", { fg = p.bright_green })
  hl(0, "@markup.quote", { fg = p.fg4, italic = true })
  hl(0, "@markup.math", { fg = p.bright_blue })
  hl(0, "@tag", { fg = p.bright_aqua })
  hl(0, "@tag.attribute", { fg = p.bright_green })
  hl(0, "@tag.delimiter", { fg = p.fg2 })
  hl(0, "@diff.plus", { fg = p.bright_green })
  hl(0, "@diff.minus", { fg = p.bright_red })
  hl(0, "@diff.delta", { fg = p.bright_blue })

  -- =============================================
  -- LSP Semantic Tokens
  -- =============================================
  hl(0, "@lsp.type.class", { fg = p.bright_aqua })
  hl(0, "@lsp.type.decorator", { fg = p.bright_green })
  hl(0, "@lsp.type.enum", { fg = p.bright_aqua })
  hl(0, "@lsp.type.enumMember", { fg = p.bright_purple })
  hl(0, "@lsp.type.function", { fg = p.bright_blue, bold = true })
  hl(0, "@lsp.type.interface", { fg = p.bright_aqua, italic = true })
  hl(0, "@lsp.type.keyword", { fg = p.bright_purple })
  hl(0, "@lsp.type.macro", { fg = p.bright_aqua })
  hl(0, "@lsp.type.method", { fg = p.bright_blue })
  hl(0, "@lsp.type.namespace", { fg = p.bright_aqua })
  hl(0, "@lsp.type.parameter", { fg = p.fg0, italic = true })
  hl(0, "@lsp.type.property", { fg = p.bright_blue })
  hl(0, "@lsp.type.struct", { fg = p.bright_aqua })
  hl(0, "@lsp.type.type", { fg = p.bright_aqua })
  hl(0, "@lsp.type.typeParameter", { fg = p.bright_aqua, italic = true })
  hl(0, "@lsp.type.variable", { fg = p.fg0 })
  hl(0, "@lsp.mod.deprecated", { strikethrough = true })
  hl(0, "@lsp.mod.readonly", { italic = true })

  -- =============================================
  -- Diagnostics
  -- =============================================
  hl(0, "DiagnosticError", { fg = p.bright_red })
  hl(0, "DiagnosticWarn", { fg = p.bright_yellow })
  hl(0, "DiagnosticInfo", { fg = p.bright_blue })
  hl(0, "DiagnosticHint", { fg = p.bright_aqua })
  hl(0, "DiagnosticOk", { fg = p.bright_green })
  hl(0, "DiagnosticUnderlineError", { sp = p.bright_red, undercurl = true })
  hl(0, "DiagnosticUnderlineWarn", { sp = p.bright_yellow, undercurl = true })
  hl(0, "DiagnosticUnderlineInfo", { sp = p.bright_blue, undercurl = true })
  hl(0, "DiagnosticUnderlineHint", { sp = p.bright_aqua, undercurl = true })
  hl(0, "DiagnosticUnderlineOk", { sp = p.bright_green, undercurl = true })
  hl(0, "DiagnosticVirtualTextError", { fg = p.bright_red, bg = "#2a1a1a" })
  hl(0, "DiagnosticVirtualTextWarn", { fg = p.bright_yellow, bg = "#2a2518" })
  hl(0, "DiagnosticVirtualTextInfo", { fg = p.bright_blue, bg = "#1a2028" })
  hl(0, "DiagnosticVirtualTextHint", { fg = p.bright_aqua, bg = "#1a2a22" })
  hl(0, "DiagnosticVirtualTextOk", { fg = p.bright_green, bg = "#1a2a1a" })
  hl(0, "DiagnosticSignError", { fg = p.bright_red, bg = p.bg0 })
  hl(0, "DiagnosticSignWarn", { fg = p.bright_yellow, bg = p.bg0 })
  hl(0, "DiagnosticSignInfo", { fg = p.bright_blue, bg = p.bg0 })
  hl(0, "DiagnosticSignHint", { fg = p.bright_aqua, bg = p.bg0 })
  hl(0, "DiagnosticSignOk", { fg = p.bright_green, bg = p.bg0 })
  hl(0, "DiagnosticFloatingError", { fg = p.bright_red })
  hl(0, "DiagnosticFloatingWarn", { fg = p.bright_yellow })
  hl(0, "DiagnosticFloatingInfo", { fg = p.bright_blue })
  hl(0, "DiagnosticFloatingHint", { fg = p.bright_aqua })
  hl(0, "DiagnosticFloatingOk", { fg = p.bright_green })

  -- =============================================
  -- LSP References
  -- =============================================
  hl(0, "LspReferenceText", { bg = p.bg3 })
  hl(0, "LspReferenceRead", { bg = p.bg3 })
  hl(0, "LspReferenceWrite", { bg = p.bg3, bold = true })
  hl(0, "LspSignatureActiveParameter", { fg = p.bright_orange, bold = true })
  hl(0, "LspCodeLens", { fg = p.fg4 })
  hl(0, "LspCodeLensSeparator", { fg = p.bg4 })
  hl(0, "LspInlayHint", { fg = p.fg4, bg = p.bg1, italic = true })

  -- =============================================
  -- Telescope
  -- =============================================
  hl(0, "TelescopeNormal", { fg = p.fg1, bg = p.bg1 })
  hl(0, "TelescopeBorder", { fg = p.bg3, bg = p.bg1 })
  hl(0, "TelescopeTitle", { fg = p.bright_purple, bg = p.bg1, bold = true })
  hl(0, "TelescopePromptNormal", { fg = p.fg0, bg = p.bg1 })
  hl(0, "TelescopePromptBorder", { fg = p.bg3, bg = p.bg1 })
  hl(0, "TelescopePromptTitle", { fg = p.bright_purple, bg = p.bg1, bold = true })
  hl(0, "TelescopePromptPrefix", { fg = p.bright_purple, bg = p.bg1 })
  hl(0, "TelescopePromptCounter", { fg = p.fg4, bg = p.bg1 })
  hl(0, "TelescopeResultsNormal", { fg = p.fg1, bg = p.bg1 })
  hl(0, "TelescopeResultsBorder", { fg = p.bg3, bg = p.bg1 })
  hl(0, "TelescopeResultsTitle", { fg = p.bright_purple, bg = p.bg1, bold = true })
  hl(0, "TelescopePreviewNormal", { fg = p.fg1, bg = p.bg1 })
  hl(0, "TelescopePreviewBorder", { fg = p.bg3, bg = p.bg1 })
  hl(0, "TelescopePreviewTitle", { fg = p.bright_purple, bg = p.bg1, bold = true })
  hl(0, "TelescopeSelection", { fg = p.fg0, bg = p.bg3, bold = true })
  hl(0, "TelescopeSelectionCaret", { fg = p.bright_green, bg = p.bg3 })
  hl(0, "TelescopeMatching", { fg = p.bright_green, bold = true })

  -- =============================================
  -- Git Signs
  -- =============================================
  hl(0, "GitSignsAdd", { fg = p.bright_green, bg = p.bg0 })
  hl(0, "GitSignsChange", { fg = p.bright_blue, bg = p.bg0 })
  hl(0, "GitSignsDelete", { fg = p.bright_red, bg = p.bg0 })
  hl(0, "GitSignsAddNr", { fg = p.bright_green })
  hl(0, "GitSignsChangeNr", { fg = p.bright_blue })
  hl(0, "GitSignsDeleteNr", { fg = p.bright_red })
  hl(0, "GitSignsAddLn", { bg = "#1a2a1a" })
  hl(0, "GitSignsChangeLn", { bg = "#1a1f2a" })
  hl(0, "GitSignsDeleteLn", { bg = "#2a1a1a" })
  hl(0, "GitSignsCurrentLineBlame", { fg = p.fg4, italic = true })

  -- =============================================
  -- Oil
  -- =============================================
  hl(0, "OilDir", { fg = p.bright_blue, bold = true })
  hl(0, "OilDirIcon", { fg = p.bright_blue })
  hl(0, "OilFile", { fg = p.fg0 })
  hl(0, "OilSocket", { fg = p.bright_purple })
  hl(0, "OilLink", { fg = p.bright_aqua })
  hl(0, "OilLinkTarget", { fg = p.fg4, italic = true })

  -- =============================================
  -- Mini
  -- =============================================
  hl(0, "MiniStatuslineDevinfo", { fg = p.fg1, bg = p.bg3 })
  hl(0, "MiniStatuslineFileinfo", { fg = p.fg1, bg = p.bg3 })
  hl(0, "MiniStatuslineFilename", { fg = p.fg1, bg = p.bg2 })
  hl(0, "MiniStatuslineInactive", { fg = p.fg4, bg = p.bg1 })
  hl(0, "MiniStatuslineModeNormal", { fg = p.bg0, bg = p.bright_blue, bold = true })
  hl(0, "MiniStatuslineModeInsert", { fg = p.bg0, bg = p.bright_green, bold = true })
  hl(0, "MiniStatuslineModeVisual", { fg = p.bg0, bg = p.bright_purple, bold = true })
  hl(0, "MiniStatuslineModeReplace", { fg = p.bg0, bg = p.bright_red, bold = true })
  hl(0, "MiniStatuslineModeCommand", { fg = p.bg0, bg = p.bright_yellow, bold = true })
  hl(0, "MiniStatuslineModeOther", { fg = p.bg0, bg = p.bright_aqua, bold = true })

  hl(0, "MiniCursorword", { bg = p.bg3 })
  hl(0, "MiniCursorwordCurrent", { bg = p.bg3 })

  hl(0, "MiniIndentscopeSymbol", { fg = p.bg4 })

  hl(0, "MiniJump", { fg = p.bg0, bg = p.bright_yellow })
  hl(0, "MiniJump2dSpot", { fg = p.bright_orange, bold = true })

  hl(0, "MiniPickBorder", { fg = p.bg4, bg = p.bg1 })
  hl(0, "MiniPickNormal", { fg = p.fg1, bg = p.bg1 })
  hl(0, "MiniPickMatchCurrent", { bg = p.bg3 })
  hl(0, "MiniPickMatchMarked", { fg = p.bright_aqua, bold = true })
  hl(0, "MiniPickPrompt", { fg = p.bright_green, bg = p.bg1 })

  hl(0, "MiniSurround", { fg = p.bg0, bg = p.bright_orange })

  hl(0, "MiniNotifyBorder", { fg = p.bg4, bg = p.bg1 })
  hl(0, "MiniNotifyNormal", { fg = p.fg1, bg = p.bg1 })
  hl(0, "MiniNotifyTitle", { fg = p.bright_orange, bold = true })

  hl(0, "MiniDiffSignAdd", { fg = p.bright_green, bg = p.bg0 })
  hl(0, "MiniDiffSignChange", { fg = p.bright_blue, bg = p.bg0 })
  hl(0, "MiniDiffSignDelete", { fg = p.bright_red, bg = p.bg0 })
  hl(0, "MiniDiffOverAdd", { bg = "#1a2a1a" })
  hl(0, "MiniDiffOverChange", { bg = "#1a1f2a" })
  hl(0, "MiniDiffOverDelete", { bg = "#2a1a1a" })
  hl(0, "MiniDiffOverContext", { bg = p.bg1 })

  -- =============================================
  -- Harpoon
  -- =============================================
  hl(0, "HarpoonWindow", { fg = p.fg1, bg = p.bg1 })
  hl(0, "HarpoonBorder", { fg = p.bg4, bg = p.bg1 })
  hl(0, "HarpoonTitle", { fg = p.bright_orange, bg = p.bg1, bold = true })

  -- =============================================
  -- Lazy
  -- =============================================
  hl(0, "LazyButton", { fg = p.fg1, bg = p.bg2 })
  hl(0, "LazyButtonActive", { fg = p.bg0, bg = p.bright_blue, bold = true })
  hl(0, "LazyH1", { fg = p.bg0, bg = p.bright_blue, bold = true })
  hl(0, "LazyH2", { fg = p.bright_green, bold = true })
  hl(0, "LazyComment", { fg = p.fg4 })
  hl(0, "LazyCommit", { fg = p.bright_green })
  hl(0, "LazyCommitType", { fg = p.bright_yellow })
  hl(0, "LazyDimmed", { fg = p.fg4 })
  hl(0, "LazyNormal", { fg = p.fg0, bg = p.bg0 })
  hl(0, "LazyProgressDone", { fg = p.bright_green })
  hl(0, "LazyProgressTodo", { fg = p.bg4 })
  hl(0, "LazyReasonPlugin", { fg = p.bright_blue })
  hl(0, "LazySpecial", { fg = p.bright_orange })
  hl(0, "LazyUrl", { fg = p.bright_blue, underline = true })

  -- =============================================
  -- Mason
  -- =============================================
  hl(0, "MasonNormal", { fg = p.fg0, bg = p.bg0 })
  hl(0, "MasonHeader", { fg = p.bg0, bg = p.bright_blue, bold = true })
  hl(0, "MasonHighlight", { fg = p.bright_blue })
  hl(0, "MasonHighlightBlock", { fg = p.bg0, bg = p.bright_blue })
  hl(0, "MasonHighlightBlockBold", { fg = p.bg0, bg = p.bright_blue, bold = true })
  hl(0, "MasonMuted", { fg = p.fg4 })
  hl(0, "MasonMutedBlock", { fg = p.fg4, bg = p.bg2 })
end

return M
