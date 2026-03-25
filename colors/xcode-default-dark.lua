-- xcode-default-dark.lua
-- Ported from smockle/xcode-default-theme (xcode-default-dark-theme.json)
-- Covers: UI, classic vim syntax, treesitter, LSP semantic tokens

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "xcode-default-dark"
vim.o.background = "dark"

local c = {
  bg         = "#292A30",
  bg_panel   = "#252629",
  bg_dark    = "#1C1D20",
  border     = "#16171A",
  line_hl    = "#2F3239",
  selection  = "#3D4752",
  fg         = "#FFFFFF",
  fg_muted   = "#A6A7A8",
  fg_subtle  = "#747478",
  accent     = "#3C93FD",
  comment    = "#7F8C99",
  keyword    = "#FF7AB2",
  string     = "#FC6A5D",
  number     = "#A79DF8",
  func       = "#FF816F",
  type       = "#8AD1C3",
  module     = "#91D462",
  attr       = "#FFC799",
  decorator  = "#FD8F3F",
  css_prop   = "#FC5FA3",
  -- diagnostics
  error      = "#FF5555",
  warning    = "#FFBD2E",
  info       = "#82ADF3",
  hint       = "#8AD1C3",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Base UI ──────────────────────────────────────────────────────────────────
hi("Normal",          { fg = c.fg,       bg = c.bg })
hi("NormalNC",        { fg = c.fg_muted, bg = c.bg })
hi("NormalFloat",     { fg = c.fg,       bg = c.bg_panel })
hi("FloatBorder",     { fg = c.border,   bg = c.bg_panel })
hi("FloatTitle",      { fg = c.fg,       bg = c.bg_panel, bold = true })

hi("LineNr",          { fg = c.fg_subtle })
hi("CursorLineNr",    { fg = c.fg,       bold = true })
hi("CursorLine",      { bg = c.line_hl })
hi("CursorColumn",    { bg = c.line_hl })
hi("ColorColumn",     { bg = c.line_hl })

hi("Visual",          { bg = c.selection })
hi("VisualNOS",       { bg = c.selection })

hi("Search",          { fg = c.bg,    bg = c.accent })
hi("IncSearch",       { fg = c.bg,    bg = c.keyword })
hi("CurSearch",       { fg = c.bg,    bg = c.keyword })
hi("Substitute",      { fg = c.bg,    bg = c.keyword })

hi("StatusLine",      { fg = c.fg_muted,  bg = c.bg_panel })
hi("StatusLineNC",    { fg = c.fg_subtle, bg = c.bg_dark })
hi("WinSeparator",    { fg = c.border })
hi("VertSplit",       { fg = c.border })
hi("TabLine",         { fg = c.fg_muted,  bg = c.bg_panel })
hi("TabLineSel",      { fg = c.fg,        bg = c.bg,      bold = true })
hi("TabLineFill",     { bg = c.bg_dark })

hi("Pmenu",           { fg = c.fg,       bg = c.bg_panel })
hi("PmenuSel",        { fg = c.fg,       bg = c.selection, bold = true })
hi("PmenuSbar",       { bg = c.bg_dark })
hi("PmenuThumb",      { bg = c.fg_subtle })

hi("SignColumn",      { fg = c.fg_subtle, bg = c.bg })
hi("FoldColumn",      { fg = c.fg_subtle, bg = c.bg })
hi("Folded",          { fg = c.comment,   bg = c.bg_panel, italic = true })

hi("MatchParen",      { fg = c.fg, bg = c.selection, bold = true })
hi("NonText",         { fg = c.fg_subtle })
hi("SpecialKey",      { fg = c.fg_subtle })
hi("Whitespace",      { fg = c.border })
hi("EndOfBuffer",     { fg = c.border })

hi("Title",           { fg = c.module,  bold = true })
hi("Directory",       { fg = c.accent })
hi("Question",        { fg = c.accent })
hi("MoreMsg",         { fg = c.module })
hi("ModeMsg",         { fg = c.fg,      bold = true })
hi("MsgArea",         { fg = c.fg })

hi("ErrorMsg",        { fg = c.error })
hi("WarningMsg",      { fg = c.warning })

hi("DiffAdd",         { bg = "#1C3A1C" })
hi("DiffChange",      { bg = "#1C2A3A" })
hi("DiffDelete",      { fg = c.error,   bg = "#3A1C1C" })
hi("DiffText",        { bg = "#2A3A4A", bold = true })

hi("SpellBad",        { undercurl = true, sp = c.error })
hi("SpellCap",        { undercurl = true, sp = c.warning })
hi("SpellRare",       { undercurl = true, sp = c.info })
hi("SpellLocal",      { undercurl = true, sp = c.hint })

-- ── Classic Vim Syntax ───────────────────────────────────────────────────────
hi("Comment",       { fg = c.comment, italic = true })

hi("Constant",      { fg = c.number })
hi("String",        { fg = c.string })
hi("Character",     { fg = c.string })
hi("Number",        { fg = c.number })
hi("Float",         { fg = c.number })
hi("Boolean",       { fg = c.keyword, bold = true })

hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.func })

hi("Statement",     { fg = c.keyword, bold = true })
hi("Conditional",   { fg = c.keyword, bold = true })
hi("Repeat",        { fg = c.keyword, bold = true })
hi("Label",         { fg = c.keyword, bold = true })
hi("Operator",      { fg = c.fg })
hi("Keyword",       { fg = c.keyword, bold = true })
hi("Exception",     { fg = c.keyword, bold = true })

hi("PreProc",       { fg = c.keyword })
hi("Include",       { fg = c.keyword })
hi("Define",        { fg = c.keyword })
hi("Macro",         { fg = c.keyword })
hi("PreCondit",     { fg = c.keyword })

hi("Type",          { fg = c.type })
hi("StorageClass",  { fg = c.keyword, bold = true })
hi("Structure",     { fg = c.type })
hi("Typedef",       { fg = c.type })

hi("Special",       { fg = c.attr })
hi("SpecialChar",   { fg = c.attr })
hi("Tag",           { fg = c.keyword })
hi("Delimiter",     { fg = c.fg })
hi("SpecialComment",{ fg = c.comment, italic = true })
hi("Debug",         { fg = c.attr })

hi("Underlined",    { underline = true })
hi("Ignore",        { fg = c.fg_subtle })
hi("Error",         { fg = c.error })
hi("Todo",          { fg = c.bg, bg = c.warning, bold = true })

-- ── Treesitter ───────────────────────────────────────────────────────────────
-- Comments
hi("@comment",                  { fg = c.comment, italic = true })
hi("@comment.documentation",    { fg = c.comment, italic = true })

-- Keywords — keyword.*, storage.*, constant.language, variable.language.*
hi("@keyword",                  { fg = c.keyword, bold = true })
hi("@keyword.function",         { fg = c.keyword, bold = true })
hi("@keyword.return",           { fg = c.keyword, bold = true })
hi("@keyword.import",           { fg = c.keyword, bold = true })
hi("@keyword.operator",         { fg = c.keyword, bold = true })
hi("@keyword.coroutine",        { fg = c.keyword, bold = true })
hi("@keyword.conditional",      { fg = c.keyword, bold = true })
hi("@keyword.repeat",           { fg = c.keyword, bold = true })
hi("@keyword.exception",        { fg = c.keyword, bold = true })
hi("@keyword.modifier",         { fg = c.keyword, bold = true })
hi("@keyword.type",             { fg = c.keyword, bold = true })
hi("@keyword.debug",            { fg = c.keyword, bold = true })

-- Storage / declarations
hi("@storageclass",             { fg = c.keyword, bold = true })

-- Constants / booleans
hi("@boolean",                  { fg = c.keyword, bold = true })
hi("@constant",                 { fg = c.fg })
hi("@constant.builtin",         { fg = c.keyword, bold = true })
hi("@constant.macro",           { fg = c.keyword })

-- Strings
hi("@string",                   { fg = c.string })
hi("@string.escape",            { fg = c.attr })
hi("@string.regexp",            { fg = c.string })
hi("@string.special",           { fg = c.attr })

-- Numbers
hi("@number",                   { fg = c.number })
hi("@number.float",             { fg = c.number })
hi("@float",                    { fg = c.number })

-- Functions — entity.name.function, support.function
hi("@function",                 { fg = c.func })
hi("@function.call",            { fg = c.func })
hi("@function.builtin",         { fg = c.func })
hi("@function.method",          { fg = c.func })
hi("@function.method.call",     { fg = c.func })
hi("@function.macro",           { fg = c.func })

-- Constructor — new.expr entity.name
hi("@constructor",              { fg = c.type })

-- Types — entity.name.type, meta.type, meta.return.type, support.type.primitive
hi("@type",                     { fg = c.type })
hi("@type.builtin",             { fg = c.type })
hi("@type.definition",          { fg = c.type })
hi("@type.qualifier",           { fg = c.keyword, bold = true })

-- Module / namespace — entity.name.type.module, entity.other.inherited-class
hi("@module",                   { fg = c.module })
hi("@namespace",                { fg = c.module })

-- Variables
hi("@variable",                 { fg = c.fg })
hi("@variable.builtin",         { fg = c.keyword, bold = true })
hi("@variable.parameter",       { fg = c.fg })
hi("@variable.member",          { fg = c.type })  -- variable.other.property

-- Properties — variable.other.property, support.variable.property
hi("@property",                 { fg = c.type })

-- Tags — meta.tag entity.name.tag
hi("@tag",                      { fg = c.keyword, bold = true })
hi("@tag.builtin",              { fg = c.keyword, bold = true })
hi("@tag.attribute",            { fg = c.attr })  -- meta.tag entity.other.attribute-name
hi("@tag.delimiter",            { fg = c.fg_muted })

-- Attributes / decorators — meta.decorator
hi("@attribute",                { fg = c.decorator })

-- Operators & punctuation
hi("@operator",                 { fg = c.fg })
hi("@punctuation.delimiter",    { fg = c.fg })
hi("@punctuation.bracket",      { fg = c.fg })
hi("@punctuation.special",      { fg = c.attr })

-- Markup (markdown etc.)
hi("@markup.heading",           { fg = c.string, bold = true })
hi("@markup.raw",               { fg = c.type })
hi("@markup.link",              { fg = c.accent, underline = true })
hi("@markup.link.label",        { fg = c.accent })
hi("@markup.list",              { fg = c.string })
hi("@markup.strong",            { bold = true })
hi("@markup.italic",            { italic = true })
hi("@markup.strikethrough",     { strikethrough = true })

-- ── LSP Semantic Tokens ──────────────────────────────────────────────────────
hi("@lsp.type.function",        { fg = c.func })
hi("@lsp.type.method",          { fg = c.func })
hi("@lsp.type.keyword",         { fg = c.keyword, bold = true })
hi("@lsp.type.type",            { fg = c.type })
hi("@lsp.type.class",           { fg = c.type })
hi("@lsp.type.interface",       { fg = c.type })
hi("@lsp.type.struct",          { fg = c.type })
hi("@lsp.type.enum",            { fg = c.type })
hi("@lsp.type.enumMember",      { fg = c.number })
hi("@lsp.type.variable",        { fg = c.fg })
hi("@lsp.type.parameter",       { fg = c.fg })
hi("@lsp.type.property",        { fg = c.type })
hi("@lsp.type.namespace",       { fg = c.module })
hi("@lsp.type.decorator",       { fg = c.decorator })
hi("@lsp.type.comment",         { fg = c.comment, italic = true })
hi("@lsp.type.string",          { fg = c.string })
hi("@lsp.type.number",          { fg = c.number })
hi("@lsp.type.boolean",         { fg = c.keyword, bold = true })
hi("@lsp.type.selfKeyword",     { fg = c.keyword, bold = true })
hi("@lsp.type.builtinType",     { fg = c.type })
hi("@lsp.mod.documentation",    { fg = c.comment, italic = true })
hi("@lsp.mod.readonly",         { fg = c.fg })
hi("@lsp.mod.static",           { fg = c.func })
hi("@lsp.mod.deprecated",       { strikethrough = true })

-- ── Diagnostics ──────────────────────────────────────────────────────────────
hi("DiagnosticError",           { fg = c.error })
hi("DiagnosticWarn",            { fg = c.warning })
hi("DiagnosticInfo",            { fg = c.info })
hi("DiagnosticHint",            { fg = c.hint })
hi("DiagnosticUnnecessary",     { fg = c.fg_subtle })
hi("DiagnosticUnderlineError",  { undercurl = true, sp = c.error })
hi("DiagnosticUnderlineWarn",   { undercurl = true, sp = c.warning })
hi("DiagnosticUnderlineInfo",   { undercurl = true, sp = c.info })
hi("DiagnosticUnderlineHint",   { undercurl = true, sp = c.hint })
hi("DiagnosticVirtualTextError",{ fg = c.error,   bg = "#3A1C1C" })
hi("DiagnosticVirtualTextWarn", { fg = c.warning, bg = "#2A2215" })
hi("DiagnosticVirtualTextInfo", { fg = c.info })
hi("DiagnosticVirtualTextHint", { fg = c.hint })
