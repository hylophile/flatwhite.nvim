---@class Highlight
---@field fg string color name or "#RRGGBB"
---@field foreground string same fg, color name or "#RRGGBB"
---@field bg string color name or "#RRGGBB"
---@field background string same bg, color name or "#RRGGBB"
---@field sp string color name or "#RRGGBB"
---@field special string same sg, color name or "#RRGGBB"
---@field blend integer value between 0 and 100
---@field bold boolean
---@field standout boolean
---@field underline boolean
---@field undercurl boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean
---@field italic boolean
---@field reverse boolean
---@field nocombine boolean
---@field link string name of another highlight group to link to, see |:hi-link|.
---@field default string Don't override existing definition |:hi-default|
---@field ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@field ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@field cterm table cterm attribute map, like |highlight-args|.

---setup highlight groups
---@param configs DefaultConfig
---@return table<string, Highlight>
---@nodiscard
local function setup(configs)
   local colors = configs.colors
   local endOfBuffer = {
      fg = configs.show_end_of_buffer and colors.visual or colors.bg,
   }

   return {
      Normal = colors.fw_base,
      NormalFloat = { fg = colors.fg, bg = colors.base6 },
      Comment = { fg = colors.comment, italic = configs.italic_comment },
      Constant = colors.fw_teal,
      String = colors.fw_green,
      Character = colors.fw_green,
      Number = colors.fw_teal,
      Boolean = colors.fw_teal,
      Float = colors.fw_teal,
      FloatBorder = colors.fw_base,
      Operator = colors.fw_base,
      Keyword = colors.fw_purple,
      Keywords = colors.fw_purple,
      Identifier = colors.fw_base,
      Function = colors.fw_base_bold,
      Statement = colors.fw_base,
      Conditional = colors.fw_purple,
      Repeat = colors.fw_purple,
      Label = colors.fw_teal,
      Exception = colors.fw_purple,
      PreProc = colors.fw_orange,
      Include = colors.fw_purple,
      Define = colors.fw_purple,
      Title = colors.fw_teal,
      Macro = colors.fw_base_bold,
      PreCondit = colors.fw_teal,
      Type = colors.fw_teal,
      StorageClass = colors.fw_purple,
      Structure = colors.fw_orange,
      TypeDef = { fg = colors.yellow },
      Special = { fg = colors.green_text, bg = colors.green_bg, italic = true },
      SpecialComment = { fg = colors.comment, italic = true },
      Error = colors.fw_red,
      Todo = { fg = colors.blue_text, bg = colors.blue_bg, bold = true, italic = true },
      Underlined = { fg = colors.cyan, underline = true },
      Cursor = { reverse = true },
      SignColumn = { bg = colors.bg },
      Conceal = { fg = colors.comment },
      CursorColumn = { bg = colors.black },
      CursorLine = { bg = colors.base4 },
      CursorLineNr = { bg = colors.base4 },
      ColorColumn = { bg = colors.selection },
      StatusLine = { fg = colors.white, bg = colors.black },
      StatusLineNC = { fg = colors.comment },
      StatusLineTerm = { fg = colors.white, bg = colors.black },
      StatusLineTermNC = { fg = colors.comment },
      Directory = colors.fw_teal,
      MoreMsg = colors.fw_green,
      ModeMsg = {bold = true},
      DiffAdd = colors.fw_green,
      DiffChange = colors.fw_orange,
      DiffDelete = colors.fw_red,
      DiffText = { fg = colors.comment },
      ErrorMsg = colors.fw_red,
      VertSplit = { fg = colors.black },
      Folded = { fg = colors.comment },
      FoldColumn = {},
      Search = { fg = colors.bg, bg = colors.purple_text_sec },
      IncSearch = { fg = colors.bg, bg = colors.purple_text_sec },
      -- IncSearch = { fg = colors.orange, bg = colors.comment },
      LineNr = { fg = colors.comment },
      MatchParen = { fg = colors.bg, bg = colors.blue_text_sec },
      NonText = { fg = colors.nontext },
      Pmenu = { fg = colors.fg, bg = colors.menu },
      PmenuSel = { fg = colors.fg, bg = colors.base6 },
      PmenuSbar = { bg = colors.menu },
      PmenuThumb = { bg = colors.base3 },
      Question = colors.fw_purple,
      QuickFixLine = { fg = colors.black, bg = colors.yellow },
      SpecialKey = { fg = colors.nontext },
      SpellBad = { fg = colors.bright_red, underline = true },
      SpellCap = { fg = colors.yellow },
      SpellLocal = { fg = colors.yellow },
      SpellRare = { fg = colors.yellow },
      TabLine = { fg = colors.comment, bg = colors.base4 },
      TabLineSel = { fg = colors.white },
      TabLineFill = { bg = colors.base4 },
      Terminal = { fg = colors.white, bg = colors.black },
      Visual = { bg = colors.visual },
      VisualNOS = { fg = colors.visual },
      WarningMsg = { fg = colors.yellow },
      WildMenu = { fg = colors.fg, bg = colors.menu },
      EndOfBuffer = endOfBuffer,
      WinSeparator = { fg = colors.base3 },
      -- TreeSitter
      ["@error"] = colors.fw_red,
      ["@punctuation.delimiter"] = colors.fw_base,
      ["@punctuation.bracket"] = colors.fw_base,
      -- ["@punctuation.special"] = { fg = colors.fg },
      ["@punctuation.special"] = colors.fw_base,
      ["@constant"] = colors.fw_teal,
      ["@constant.builtin"] = colors.fw_teal,
      ["@symbol"] = colors.fw_base,
      ["@comment"] = { fg = colors.base2, italic = true },
      ["@constant.macro"] = colors.fw_teal,
      ["@string.regex"] = colors.fw_red,
      ["@string"] = colors.fw_green,
      ["@string.escape"] = colors.fw_blue,
      ["@character"] = colors.fw_green,
      ["@number"] = colors.fw_teal,
      ["@boolean"] = colors.fw_teal,
      ["@float"] = colors.fw_teal,
      ["@annotation"] = colors.fw_blue,
      ["@attribute"] = colors.fw_blue,
      ["@namespace"] = colors.fw_base,
      ["@function.builtin"] = colors.fw_base_bold,
      ["@function"] = colors.fw_yellow,
      ["@function.macro"] = colors.fw_base_bold,
      ["@parameter"] = colors.fw_base,
      ["@parameter.reference"] = colors.fw_base,
      ["@method"] = colors.fw_base,
      ["@field"] = colors.fw_base,
      ["@string.field"] = colors.fw_base,
      ["@property"] = colors.fw_base,
      ["@constructor"] = colors.fw_base,
      ["@conditional"] = colors.fw_purple,
      ["@repeat"] = colors.fw_purple,
      ["@label"] = colors.fw_teal,
      ["@keyword"] = colors.fw_purple,
      ["@keyword.function"] = colors.fw_purple,
      ["@keyword.operator"] = colors.fw_purple,
      ["@operator"] = colors.fw_purple,
      ["@exception"] = colors.fw_purple,
      ["@type"] = colors.fw_teal,
      ["@type.builtin"] = colors.fw_teal,
      ["@type.qualifier"] = colors.fw_purple,
      ["@structure"] = colors.fw_purple,
      ["@include"] = colors.fw_purple,
      ["@variable"] = colors.fw_base,
      ["@variable.builtin"] = colors.fw_base,
      ["@text"] = colors.fw_orange,
      ["@text.strong"] = { fg = colors.orange_text, bg = colors.orange_bg, bold = true },
      ["@text.emphasis"] = { fg = colors.orange_text, bg = colors.orange_bg, italic = true },
      ["@text.underline"] = { fg = colors.orange_text, bg = colors.orange_bg, underline = true },
      ["@text.title"] = { fg = colors.purple_text, bg = colors.purple_bg, bold = true }, -- title
      ["@text.literal"] = colors.fw_orange,
      ["@text.uri"] = { fg = colors.blue_text, bg = colors.blue_bg, italic = true },     -- urls
      ["@text.reference"] = { fg = colors.orange_text, bg = colors.orange_bg, bold = true },
      ["@tag"] = colors.fw_purple,
      ["@tag.attribute"] = { fg = colors.base2, bg = colors.base7, italic = true },
      ["@tag.delimiter"] = { fg = colors.base2, bg = colors.base7, },
      -- Semantic
      ["@class"] = colors.fw_teal,
      ["@struct"] = colors.fw_teal,
      ["@enum"] = colors.fw_teal,
      ["@enumMember"] = colors.fw_purple,
      ["@event"] = colors.fw_teal,
      ["@interface"] = colors.fw_teal,
      ["@modifier"] = colors.fw_teal,
      ["@regexp"] = colors.fw_blue,
      ["@typeParameter"] = colors.fw_teal,
      ["@decorator"] = colors.fw_teal,
      -- HTML
      htmlArg = { fg = colors.green },
      htmlBold = { fg = colors.yellow, bold = true },
      htmlEndTag = { fg = colors.cyan },
      htmlH1 = { fg = colors.pink },
      htmlH2 = { fg = colors.pink },
      htmlH3 = { fg = colors.pink },
      htmlH4 = { fg = colors.pink },
      htmlH5 = { fg = colors.pink },
      htmlH6 = { fg = colors.pink },
      htmlItalic = { fg = colors.purple, italic = true },
      htmlLink = { fg = colors.purple, underline = true },
      htmlSpecialChar = { fg = colors.yellow },
      htmlSpecialTagName = { fg = colors.cyan },
      htmlTag = { fg = colors.cyan },
      htmlTagN = { fg = colors.cyan },
      htmlTagName = { fg = colors.cyan },
      htmlTitle = { fg = colors.white },
      -- Markdown
      markdownBlockquote = { fg = colors.yellow, italic = true },
      markdownBold = { fg = colors.orange, bold = true },
      markdownCode = { fg = colors.green },
      markdownCodeBlock = { fg = colors.orange },
      markdownCodeDelimiter = { fg = colors.red },
      markdownH1 = { fg = colors.pink, bold = true },
      markdownH2 = { fg = colors.pink, bold = true },
      markdownH3 = { fg = colors.pink, bold = true },
      markdownH4 = { fg = colors.pink, bold = true },
      markdownH5 = { fg = colors.pink, bold = true },
      markdownH6 = { fg = colors.pink, bold = true },
      markdownHeadingDelimiter = { fg = colors.red },
      markdownHeadingRule = { fg = colors.comment },
      markdownId = { fg = colors.purple },
      markdownIdDeclaration = { fg = colors.cyan },
      markdownIdDelimiter = { fg = colors.purple },
      markdownItalic = { fg = colors.yellow, italic = true },
      markdownLinkDelimiter = { fg = colors.purple },
      markdownLinkText = { fg = colors.pink },
      markdownListMarker = { fg = colors.cyan },
      markdownOrderedListMarker = { fg = colors.red },
      markdownRule = { fg = colors.comment },
      --  Diff
      diffAdded = { fg = colors.green },
      diffRemoved = { fg = colors.red },
      diffFileId = { fg = colors.yellow, bold = true, reverse = true },
      diffFile = { fg = colors.nontext },
      diffNewFile = { fg = colors.green },
      diffOldFile = { fg = colors.red },
      debugPc = { bg = colors.cyan },
      debugBreakpoint = { fg = colors.red, reverse = true },
      -- Git Signs
      GitSignsAdd = colors.fw_green,
      GitSignsChange = colors.fw_orange,
      GitSignsDelete = colors.fw_red,
      GitSignsAddLn = { fg = colors.black, bg = colors.bright_green },
      GitSignsChangeLn = { fg = colors.black, bg = colors.cyan },
      GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red },
      GitSignsCurrentLineBlame = { fg = colors.white },
      -- Telescope
      TelescopePromptBorder = { fg = colors.comment },
      TelescopeResultsBorder = { fg = colors.comment },
      TelescopePreviewBorder = { fg = colors.comment },
      TelescopeSelection = { fg = colors.white, bg = colors.selection },
      TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection },
      TelescopeNormal = { fg = colors.fg, bg = colors.bg },
      TelescopeMatching = colors.fw_green,
      -- TelescopePromptPrefix = colors.fw_purple,

      -- NvimTree
      NvimTreeNormal = { fg = colors.fg, bg = colors.menu },
      NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg },
      NvimTreeRootFolder = { fg = colors.fg, bold = true },
      NvimTreeGitDirty = { fg = colors.yellow },
      NvimTreeGitNew = { fg = colors.bright_green },
      NvimTreeImageFile = { fg = colors.pink },
      NvimTreeFolderIcon = { fg = colors.purple },
      NvimTreeIndentMarker = { fg = colors.nontext },
      NvimTreeEmptyFolderName = { fg = colors.comment },
      NvimTreeFolderName = { fg = colors.fg },
      NvimTreeSpecialFile = { fg = colors.pink, underline = true },
      NvimTreeOpenedFolderName = { fg = colors.fg },
      NvimTreeCursorLine = { bg = colors.selection },
      NvimTreeIn = { bg = colors.selection },
      NvimTreeEndOfBuffer = endOfBuffer,
      -- NeoTree
      NeoTreeNormal = { fg = colors.fg, bg = colors.menu },
      NeoTreeNormalNC = { fg = colors.fg, bg = colors.menu },
      NeoTreeDirectoryName = { fg = colors.fg },
      NeoTreeGitUnstaged = { fg = colors.bright_magenta },
      NeoTreeGitModified = { fg = colors.bright_magenta },
      NeoTreeGitUntracked = { fg = colors.bright_green },
      NeoTreeDirectoryIcon = { fg = colors.purple },
      NeoTreeIndentMarker = { fg = colors.nontext },
      NeoTreeDotfile = { fg = colors.comment },
      -- Bufferline
      BufferLineIndicatorSelected = { fg = colors.purple },
      BufferLineFill = { bg = colors.black },
      BufferLineBufferSelected = { bg = colors.bg },
      -- LSP
      DiagnosticError = { fg = colors.red },
      DiagnosticWarn = { fg = colors.yellow },
      DiagnosticInfo = { fg = colors.cyan },
      DiagnosticHint = { fg = colors.cyan },
      DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
      DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
      DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
      DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan },
      DiagnosticSignError = colors.fw_red,
      DiagnosticSignWarn = colors.fw_orange,
      DiagnosticSignInfo = colors.fw_teal,
      DiagnosticSignHint = colors.fw_teal,
      DiagnosticFloatingError = { fg = colors.red },
      DiagnosticFloatingWarn = { fg = colors.yellow },
      DiagnosticFloatingInfo = { fg = colors.cyan },
      DiagnosticFloatingHint = { fg = colors.cyan },
      DiagnosticVirtualTextError = { fg = colors.red },
      DiagnosticVirtualTextWarn = { fg = colors.yellow },
      DiagnosticVirtualTextInfo = { fg = colors.cyan },
      DiagnosticVirtualTextHint = { fg = colors.cyan },
      LspDiagnosticsDefaultError = { fg = colors.red },
      LspDiagnosticsDefaultWarning = { fg = colors.yellow },
      LspDiagnosticsDefaultInformation = { fg = colors.cyan },
      LspDiagnosticsDefaultHint = { fg = colors.cyan },
      LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true },
      LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true },
      LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true },
      LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true },
      LspReferenceText = { fg = colors.orange },
      LspReferenceRead = { fg = colors.orange },
      LspReferenceWrite = { fg = colors.orange },
      LspCodeLens = { fg = colors.cyan },
      --LSP Saga
      -- LspFloatWinNormal = { fg = colors.fg, bg = colors.menu },
      -- LspFloatWinBorder = { fg = colors.comment },
      -- LspSagaHoverBorder = { fg = colors.comment },
      -- LspSagaSignatureHelpBorder = { fg = colors.comment },
      -- LspSagaCodeActionBorder = { fg = colors.comment },
      -- LspSagaDefPreviewBorder = { fg = colors.comment },
      -- LspLinesDiagBorder = { fg = colors.comment },
      -- LspSagaRenameBorder = { fg = colors.comment },
      -- LspSagaBorderTitle = { fg = colors.menu },
      -- LSPSagaDiagnosticTruncateLine = { fg = colors.comment },
      -- LspSagaDiagnosticBorder = { fg = colors.comment },
      -- LspSagaShTruncateLine = { fg = colors.comment },
      -- LspSagaDocTruncateLine = { fg = colors.comment },
      -- LspSagaLspFinderBorder = { fg = colors.comment },

      -- IndentBlankLine
      IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true },
      -- Whitespace = { fg = colors.base3 },
      IndentBlanklineChar = { fg = colors.base4 },
      -- Nvim compe
      CmpItemAbbrDeprecated = { strikethrough = true },
      CmpItemAbbrMatch = colors.fw_green,
      --barbar
      BufferCurrentTarget = { fg = colors.red },
      BufferVisibleTarget = { fg = colors.red },
      BufferInactiveTarget = { fg = colors.red },
      -- Compe
      CompeDocumentation = { link = "Pmenu" },
      CompeDocumentationBorder = { link = "Pmenu" },
      -- Cmp
      CmpItemKind = { link = "Pmenu" },
      CmpItemAbbr = { link = "Pmenu" },
      CmpItemKindMethod = { link = "@method" },
      CmpItemKindText = { link = "@text" },
      CmpItemKindFunction = { link = "@function" },
      CmpItemKindConstructor = { link = "@type" },
      CmpItemKindVariable = { link = "@variable" },
      CmpItemKindClass = { link = "@type" },
      CmpItemKindInterface = { link = "@type" },
      CmpItemKindModule = { link = "@namespace" },
      CmpItemKindProperty = { link = "@property" },
      CmpItemKindOperator = { link = "@operator" },
      CmpItemKindReference = { link = "@parameter.reference" },
      CmpItemKindUnit = { link = "@field" },
      CmpItemKindValue = { link = "@field" },
      CmpItemKindField = { link = "@field" },
      CmpItemKindEnum = { link = "@field" },
      CmpItemKindKeyword = { link = "@keyword" },
      CmpItemKindSnippet = { link = "@text" },
      CmpItemKindColor = { link = "DevIconCss" },
      CmpItemKindFile = { link = "TSURI" },
      CmpItemKindFolder = { link = "TSURI" },
      CmpItemKindEvent = { link = "@constant" },
      CmpItemKindEnumMember = { link = "@field" },
      CmpItemKindConstant = { link = "@constant" },
      CmpItemKindStruct = { link = "@structure" },
      CmpItemKindTypeParameter = { link = "@parameter" },
      -- navic
      NavicIconsFile = { link = "CmpItemKindFile" },
      NavicIconsModule = { link = "CmpItemKindModule" },
      NavicIconsNamespace = { link = "CmpItemKindModule" },
      NavicIconsPackage = { link = "CmpItemKindModule" },
      NavicIconsClass = { link = "CmpItemKindClass" },
      NavicIconsMethod = { link = "CmpItemKindMethod" },
      NavicIconsProperty = { link = "CmpItemKindProperty" },
      NavicIconsField = { link = "CmpItemKindField" },
      NavicIconsConstructor = { link = "CmpItemKindConstructor" },
      NavicIconsEnum = { link = "CmpItemKindEnum" },
      NavicIconsInterface = { link = "CmpItemKindInterface" },
      NavicIconsFunction = { link = "CmpItemKindFunction" },
      NavicIconsVariable = { link = "CmpItemKindVariable" },
      NavicIconsConstant = { link = "CmpItemKindConstant" },
      NavicIconsString = { link = "String" },
      NavicIconsNumber = { link = "Number" },
      NavicIconsBoolean = { link = "Boolean" },
      NavicIconsArray = { link = "CmpItemKindClass" },
      NavicIconsObject = { link = "CmpItemKindClass" },
      NavicIconsKey = { link = "CmpItemKindKeyword" },
      NavicIconsKeyword = { link = "CmpItemKindKeyword" },
      NavicIconsNull = { fg = "blue" },
      NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
      NavicIconsStruct = { link = "CmpItemKindStruct" },
      NavicIconsEvent = { link = "CmpItemKindEvent" },
      NavicIconsOperator = { link = "CmpItemKindOperator" },
      NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
      NavicText = { fg = "gray" },
      NavicSeparator = { fg = "gray" },
      -- TS rainbow colors
      rainbowcol1 = { fg = colors.red },
      rainbowcol2 = { fg = colors.green },
      rainbowcol3 = { fg = colors.yellow },
      rainbowcol4 = { fg = colors.purple },
      rainbowcol5 = { fg = colors.pink },
      rainbowcol6 = { fg = colors.cyan },
      rainbowcol7 = { fg = colors.white },
      -- Leap
      LeapMatch = { fg = colors.bg, bg = colors.purple_text_sec },
      LeapLabelPrimary = { fg = colors.bg, bg = colors.purple_text_sec },
      LeapLabelSecondary = { fg = colors.bg, bg = colors.green_text_sec },
      -- Neogit
      -- NeogitHeadRegion = colors.fw_purple,
      NeogitBranch = colors.fw_purple,
      -- NeogitPushRegion = colors.fw_green,
      NeogitRemote = colors.fw_green,
      NeogitDiffAddHighlight = colors.fw_green,
      NeogitDiffDeleteHighlight = colors.fw_red,
      NeogitDiffContextHighlight = { bg = colors.base5 }, --{bold = true},
      NeogitHunkHeader = colors.fw_purple,
      -- NeogitHunkHeaderHighlight = {reverse = true},
   }
end

return {
   setup = setup,
}
