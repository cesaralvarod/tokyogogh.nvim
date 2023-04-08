local utils = require("tokyogogh.utils")

local M = {}

function M.load(theme)
	local options = require("tokyogogh.config").options

	local groups = {
		Foo = { bg = theme.magenta, fg = theme.magenta },
		ColorColumn = { bg = theme.black }, -- used for the colums set with 'colorcolumn'
		Conceal = { fg = theme.black }, -- placeholder characters substituited for concealed text (see 'conceallevel')
		CurSearch = { link = "IncSearch" }, -- used for highlighting a search pattern under the cursor (see 'hlsearch')
		Cursor = { fg = theme.fg_highlight, bg = theme.bg_highlight }, -- character under the cursor
		lCursor = { fg = theme.fg_highlight, bg = theme.bg_highlight }, -- character under the cursor when language-mapping is used (see 'guicursor')
		CursorIM = { fg = theme.fg_highlight, bg = theme.bg_highlight }, -- like Cursor, but used when in IME mode
		CursorColumn = { bg = theme.bg_highlight }, -- screen-column at the cursor, when 'cursorcolumn' is set
		CursorLine = { bg = theme.bg_highlight }, -- screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set
		Directory = { fg = theme.blue }, -- directory names (and other special names in listings)
		DiffAdd = { bg = theme.diff.add }, -- diff mode: Added line
		DiffChange = { bg = theme.diff.change }, -- diff mode: Changed line
		DiffDelete = { bg = theme.diff.remove }, -- diff mode: Deleted line
		DiffText = { bg = theme.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = theme.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor = {}, -- cursor in a focused terminal
		-- TermCursorNC = {}, -- cursor in an unfocused terminal
		ErrorMsg = { fg = theme.error }, -- error messages on the command line
		VertSplit = { fg = theme.border }, -- the column separating vertically split windows
		WinSeparator = { fg = theme.border_sidebar, bold = true }, -- the column separating vertically split windows
		Folded = { fg = theme.blue }, -- line used for closed folds
		FoldColumn = { bg = theme.bg, fg = theme.comment }, -- 'foldcolumn'
		SignColumn = { bg = theme.bg, fg = theme.fg_gutter }, -- column where |signs| are displayed
		-- SignColumnSB = {}, -- column where |signs| are displayed
		-- Substitute = {}, -- |:substitute| replacement text highlighting
		LineNr = { fg = theme.fg_gutter }, -- line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrBellow = {}, -- line number for when the 'relativenumber' option is set, bellow the cursor line
		CursorLineNr = { fg = theme.white }, -- like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold = {}, -- like FolfColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign = {}, -- like SignColumn when 'cursorline' is set for the cursor line
		MatchParen = { bold = true }, -- the character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = theme.blue, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea = {}, -- area for messages and cmdline
		-- MsgSeparator = {}, -- separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg = {}, -- |more-prompt|
		NonText = { fg = theme.black }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { bg = theme.bg, fg = theme.fg }, -- normal text
		NormalFloat = { fg = theme.fg, bg = theme.bg }, -- normal text in floating windows.
		FloatBorder = { fg = theme.border_highlight, bg = theme.bg_popup },
		NormalNC = { bg = theme.bg, fg = theme.fg }, -- normal text in non-current windows
		-- NormalSB = {}, -- normal text in sidebar
		Pmenu = { bg = theme.bg_popup }, -- popup menu: normal item.
		PmenuSel = { bg = utils.darken(theme.fg_gutter, 0.8) }, -- popup menu: selected item.
		PmenuSbar = { bg = utils.lighten(theme.fg_gutter, 0.5) }, -- popup menu: scrollbar.
		PmenuThumb = { bg = theme.fg_gutter }, -- popup menu: Thumb of the scrollbar.
		Question = { fg = theme.blue }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = theme.fg_gutter, fg = theme.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { bg = theme.white, fg = theme.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		SpecialKey = { fg = theme.black }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { undercurl = true, sp = theme.error }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { undercurl = true, sp = theme.warning }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { undercurl = true, sp = theme.info }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { undercurl = true, sp = theme.hint }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		-- StatusLine = { fg = theme.bg_sidebar, bg = theme.blue }, -- status line of current window
		StatusLineNC = { bg = theme.blue }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = theme.black, fg = theme.fg_gutter }, -- tab pages line, not active tab page label
		TabLineFill = { bg = theme.bg_tab }, -- tab pages line, where there are no labels
		TabLineSel = { fg = theme.bg_tab, bg = theme.blue }, -- tab pages line, active tab page label
		Title = { fg = theme.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = theme.bg_highlight_visual }, -- Visual mode selection
		VisualNOS = { bg = utils.darken(theme.blue, 0.4) }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = theme.warning }, -- warning messages
		Whitespace = { fg = theme.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = utils.darken(theme.blue, 0.4) }, -- current match in 'wildmenu' completion
		-- WinBar = {}, -- window bar of current window
		-- WinBarNC = {}, -- window bar of not-current window

		--------------------------------------------------------------------------------------------
		Comment = { fg = theme.comment, style = options.code_styles.comments }, -- any comment
		Constant = { fg = theme.orange }, -- any constant (preferred group)
		String = { fg = theme.green }, -- a string constant: "this is a string"
		Character = { fg = theme.cyan }, -- a character constant: 'c', '\n'
		-- Number = {}, -- a number constant: 234, 0xff
		-- Boolean = {}, -- a boolean constant: TRUE, false
		-- Float = {}, -- a floating point constant = 2.3e10

		Identifier = { fg = theme.red }, -- any variable name (preferred group)
		Function = { fg = theme.blue }, -- function name (also: methods for classes)
		Statement = { fg = theme.magenta }, -- any statement(preferred group)
		Conditional = { fg = theme.magenta }, -- if, then, else, endif, switch, etc.
		Repeat = { fg = theme.magenta }, -- for, do, while, etc.
		-- Label = {}, -- case, default, etc.
		Operator = { fg = theme.white }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = theme.magenta }, -- any other keyword
		-- Exception = {}, -- try, catch, throw

		PreProc = { fg = theme.cyan }, -- generic Preprocessor (preferred group)
		-- Include = {}, -- preprocessor #include
		-- Define = {}, -- preprocessor #define
		-- Macro = {}, -- same as Define
		-- PreCondit = {}, -- preprocessor #if, #else, #endif, etc.

		Type = { fg = theme.yellow }, -- int, long, char, etc. (preferred group)
		StorageClass = { fg = theme.magenta }, -- static, register, volatile, etc.
		-- -- Structure = {}, -- struct, union, enum, etc.
		-- -- Typedef = {}, -- A typedef

		-- Special = {}, -- any special symbol (preffered group)
		-- -- SpecialChar = {}, -- special character in a constant
		Tag = { fg = theme.red }, -- you can user CTRL-] on this
		-- Delimitier = {}, -- character that needs attention
		-- SpecialComment = {}, -- sepecial things inside a comment
		-- Debug = {}, -- debugging statements

		Underlined = { fg = theme.magenta, underline = true }, -- text that standa out, HTML links (preferred group)
		Bold = { bold = true },
		Italic = { italic = true },
		--
		-- Ignore = {}, -- left blank, hidden, hl-Ignore (preferred group)
		Error = { fg = theme.error }, -- any erroneus construct (preferred group)
		Todo = { fg = theme.bg, bg = theme.yellow }, -- anything that needs extra attention; mostly the keywords TODO, FIXME and XXX (preferred group)
		--
		--------------------------------------------------------------------------------------------

		-- qfLineNr = {},

		-- qfFileName = {},

		-- htmlH1 = { bold = true },
		-- htmlH2 = { bold = true },

		-- -- mkdHeading = { },
		-- -- mkdCode = { },
		-- mkdCodeDelimiter = {},
		-- mkdCodeStart = {},
		-- mkdCodeEnd = {},
		-- mkdLink = {},

		-- markdownHeadingDelimiter = {},
		-- markdownCode = {},
		-- markdownCodeBlock = {},
		-- markdownH1 = {},
		-- markdownH2 = {},
		-- markdownLinkText = {},

		-- ["helpCommand"] = {},

		-- debugPC = {}, -- used for highlighting the current line in terminal-debug
		-- debugBreakpoint = {}, -- used for breakpoint colors in terminal-debug

		--------------------------------------------------------------------------------------------

		-- LSP clients

		LspReferenceText = { bg = theme.fg_gutter }, -- used for highlighting "text" references
		LspReferenceRead = { bg = theme.fg_gutter }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = theme.fg_gutter }, -- used for highlighting "write" references
		DiagnosticError = { fg = theme.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = theme.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = theme.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = theme.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticVirtualTextError = { bg = theme.bg, fg = theme.error }, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = { bg = theme.bg, fg = theme.warning }, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = { bg = theme.bg, fg = theme.info }, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = { bg = theme.bg, fg = theme.hint }, -- Used for "Hint" diagnostic virtual text
		DiagnosticUnderlineError = { undercurl = true, sp = theme.error }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = { undercurl = true, sp = theme.warning }, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { undercurl = true, sp = theme.info }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { undercurl = true, sp = theme.hint }, -- Used to underline "Hint" diagnostics
		-- LspSignatureActiveParameter = {},
		LspCodeLens = { fg = theme.comment },
		-- LspInfoBorder = {},

		ALEErrorSign = { fg = theme.error },
		ALEWarningSign = { fg = theme.warning },
		--------------------------------------------------------------------------------------------

		-- Tressitter

		["@operator"] = { fg = theme.cyan },
		["@operator.cpp"] = { fg = theme.magenta },
		["@operator.c"] = { fg = theme.magenta },
		["@operator.lua"] = { fg = theme.white },
		["@number"] = { fg = theme.orange },
		["@number.dockerfile"] = { fg = theme.red },
		["@comment"] = { fg = theme.comment },
		["@comment.documentation"] = { fg = theme.green },
		["@comment.documentation.javascript"] = { fg = theme.comment },
		["@comment.documentation.lua"] = { fg = theme.comment },
		["@comment.documentation.go"] = { fg = theme.comment },
		["@type"] = { fg = theme.yellow },
		["@type.css"] = { fg = theme.red },
		["@type.scss"] = { fg = theme.red },
		["@type.go"] = { fg = theme.white },
		["@type.sql"] = { fg = theme.blue },
		["@type.builtin"] = { fg = theme.magenta },
		["@type.builtin.tsx"] = { fg = theme.yellow },
		["@type.builtin.typescript"] = { fg = theme.yellow },
		["@type.qualifier"] = { fg = theme.magenta },
		["@type.qualifier.php"] = { fg = theme.magenta },
		["@punctuation"] = { fg = theme.white },
		["@punctuation.dockerfile"] = { fg = theme.red },
		["@punctuation.delimiter"] = { fg = theme.white },
		["@punctuation.delimiter.markdown"] = { fg = theme.orange, bold = true },
		["@punctuation.bracket"] = { fg = theme.rainbowc1 },
		["@punctuation.bracket.lua"] = { fg = theme.white },
		["@punctuation.special"] = { fg = theme.cyan },
		["@punctuation.special.bash"] = { fg = theme.red },
		["@punctuation.special.markdown"] = { fg = theme.red },
		["@string"] = { link = "String", fg = theme.green },
		["@string.regex"] = { link = "String" },
		["@string.escape"] = { fg = theme.cyan },
		["@constructor"] = { fg = theme.magenta },
		["@constructor.tsx"] = { fg = theme.yellow },
		["@constructor.typescript"] = { fg = theme.yellow },
		["@constructor.javascript"] = { fg = theme.yellow },
		["@constructor.lua"] = { fg = theme.rainbowc1 }, -- {} brackets
		["@constructor.php"] = { fg = theme.cyan },
		["@constructor.python"] = { fg = theme.cyan },
		["@parameter"] = { fg = theme.red, italic = true },
		["@parameter.lua"] = { fg = theme.white, italic = true },
		["@parameter.python"] = { fg = theme.orange, italic = true },
		["@parameter.builtin"] = { fg = theme.white },
		["@keyword"] = { fg = theme.magenta },
		["@keyword.sql"] = { fg = theme.magenta },
		["@keyword.dockerfile"] = { fg = theme.blue },
		-- ["@keyword.coroutine"] = { }, -- For keywords related to coroutines.
		["@keyword.function"] = { fg = theme.magenta, italic = true },
		["@function.css"] = { fg = theme.cyan },
		["@function.builtin"] = { fg = theme.cyan },
		["@function.call"] = { fg = theme.blue },
		["@function.call.dockerfile"] = { fg = theme.red },
		["@function.call.go"] = { fg = theme.cyan },
		["@function.call.bash"] = { fg = theme.white },
		["@method.call.go"] = { fg = theme.cyan },
		["@label"] = { fg = theme.red },
		["@label.lua"] = { fg = theme.white },
		["@include"] = { fg = theme.magenta },
		["@include.python"] = { fg = theme.magenta, italic = true },
		["@tag"] = { fg = theme.red },
		["@tag.tsx"] = { fg = theme.red },
		["@tag.html"] = { fg = theme.red },
		["@tag.builtin.tsx"] = { fg = theme.yellow },
		["@tag.attribute"] = { fg = theme.blue, italic = true },
		["@tag.attribute.html"] = { fg = theme.blue, italic = false },
		["@tag.delimiter"] = { fg = theme.white },
		["@field"] = { fg = theme.red },
		["@field.lua"] = { fg = theme.white },
		["@field.go"] = { fg = theme.white },
		["@property.bultin.css"] = { fg = theme.cyan },
		["@property"] = { fg = theme.cyan },
		["@property.lua"] = { fg = theme.white },
		["@property.css"] = { fg = theme.blue },
		["@property.scss"] = { fg = theme.blue },
		["@variable"] = { fg = theme.red },
		["@variable.cpp"] = { fg = theme.white },
		["@variable.c"] = { fg = theme.white },
		["@variable.python"] = { fg = theme.white },
		["@variable.builtin"] = { fg = theme.yellow },
		["@variable.builtin.tsx"] = { fg = theme.red },
		["@constant"] = { fg = theme.yellow },
		["@constant.bash"] = { fg = theme.red },
		["@constant.lua"] = { fg = theme.red },
		["@constant.html"] = { fg = theme.blue },
		["@constant.gitignore"] = { fg = theme.white },
		["@constant.builtin"] = { fg = theme.orange },
		["@character"] = { fg = theme.green },
		["@identifier.tsx"] = { fg = theme.red },
		["@text.title.markdown"] = { fg = theme.red, bold = true },
		["@text.strong"] = { fg = theme.orange, bold = true },
		["@text.emphasis"] = { fg = theme.magenta, italic = true },
		["@text.strike"] = { strikethrough = true },
		["@text.literal"] = { fg = theme.green },
		["@text.uri"] = { fg = theme.green, underline = true },
		["@text.quote"] = { fg = theme.comment },
		["@text.reference"] = { fg = theme.blue },
		-- ["@text.todo.unchecked"] = {},
		-- ["@text.todo.checked"] = {},
		-- ["@text.warning"] = {},
		-- ["@text.danger"] = {},

		["@conceal"] = { fg = theme.magenta },
		["@conceal.json"] = { fg = theme.none },
		["@text.diff.add"] = { link = "DiffAdd" },
		["@text.diff.delete"] = { link = "DiffDelete" },
		["@namespace"] = { fg = theme.yellow },
		["@namespace.cpp"] = { fg = theme.cyan },
		["@preproc"] = { fg = theme.cyan },
		["@preproc.bash"] = { fg = theme.comment },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "Identifier" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.variable"] = { link = "@variables" }, -- use treesitter styles for regular variables
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },
		-- ["@lsp.typemod.variable.globalScope"] (global variables)

		-- ts-rainbow
		rainbowcol1 = { fg = theme.rainbowc1 },
		rainbowcol2 = { fg = theme.rainbowc2 },
		rainbowcol3 = { fg = theme.rainbowc3 },
		rainbowcol4 = { fg = theme.rainbowc1 },
		rainbowcol5 = { fg = theme.rainbowc2 },
		rainbowcol6 = { fg = theme.rainbowc3 },
		rainbowcol7 = { fg = theme.rainbowc1 },
		-- ts-rainbow2 (maintained fork)
		TSRainbowRed = { fg = theme.red },
		TSRainbowOrange = { fg = theme.orange },
		TSRainbowYellow = { fg = theme.yellow },
		TSRainbowGreen = { fg = theme.green },
		TSRainbowBlue = { fg = theme.blue },
		TSRainbowViolet = { fg = theme.purple },
		TSRainbowCyan = { fg = theme.cyan },
		-- diff
		diffAdded = { fg = theme.git.add },
		diffRemoved = { fg = theme.git.delete },
		diffChanged = { fg = theme.git.change },
		diffOldFile = { fg = theme.yellow },
		diffNewFile = { fg = theme.orange },
		diffFile = { fg = theme.blue },
		diffLine = { fg = theme.comment },
		diffIndexLine = { fg = theme.magenta },
		-- GitSigns
		GitSignsAdd = { fg = theme.git.add }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = theme.git.change }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = theme.git.delete }, -- diff mode: Deleted line |diff.txt|
		-- Telescope
		TelescopeBorder = { fg = theme.border_highlight },
		TelescopeNormal = { fg = theme.fg },
		-- NvimTree
		NvimTreeNormal = { fg = theme.fg_sidebar, bg = theme.bg_sidebar },
		NvimTreeWinSeparator = { fg = theme.border_sidebar, bg = theme.bg_sidebar },
		NvimTreeNormalNC = { fg = theme.fg_sidebar, bg = theme.bg_sidebar },
		NvimTreeRootFolder = { fg = theme.orange, bold = true },
		NvimTreeGitDirty = { fg = theme.git.change },
		NvimTreeGitNew = { fg = theme.git.add },
		NvimTreeGitDeleted = { fg = theme.git.delete },
		NvimTreeOpenedFile = { bg = theme.bg_highlight },
		NvimTreeSpecialFile = { fg = theme.red, underline = true, italic = true },
		NvimTreeIndentMarker = { fg = theme.fg_gutter },
		NvimTreeImageFile = { fg = theme.fg_sidebar },
		NvimTreeSymlink = { fg = theme.blue },
		NvimTreeFolderIcon = { bg = theme.none, fg = theme.blue },
		NvimTreeFolderName = { link = "Directory" },
		-- NeoTree
		NeoTreeNormal = { fg = theme.fg_sidebar, bg = theme.bg_sidebar },
		NeoTreeNormalNC = { bg = theme.none, fg = theme.blue },
		NeoTreeDimText = { fg = theme.fg_gutter },
		-- Bufferline
		BufferlineIndicatorSelected = { fg = theme.orange },
		BufferlineFill = { bg = theme.bg_tab, fg = theme.bg_tab },
		BufferlineBufferSelected = { fg = theme.white },
		-- sneak
		Sneak = { fg = theme.bg_highlight, bg = theme.magenta },
		SneakScope = { bg = theme.bg_visual },
		-- Hop
		HopNextKey = { fg = theme.magenta, bold = true },
		HopNextKey1 = { fg = theme.blue, bold = true },
		HopNextKey2 = { fg = utils.darken(theme.blue, 0.6) },
		HopUnmatched = { fg = theme.black },
		-- TS Playground
		TSNodeKey = { fg = theme.magenta, bold = true },
		TSNodeUnmatched = { fg = theme.dark },
		-- leap
		LeapMatch = { bg = theme.magenta, fg = theme.fg, bold = true },
		LeapLabelPrimary = { fg = theme.magenta, bold = true },
		LeapLabelSecondary = { fg = theme.green, bold = true },
		LeapBackdrop = { fg = theme.dark },
		-- lightspeed
		LightspeedGreyWash = { fg = theme.dark },
		-- LightspeedCursor = { link = "Cursor" },
		LightspeedLabel = { fg = theme.magenta, bold = true, underline = true },
		LightspeedLabelDistant = { fg = theme.green, bold = true, underline = true },
		LightspeedLabelDistantOverlapped = { fg = theme.green, underline = true },
		LightspeedLabelOverlapped = { fg = theme.magenta, underline = true },
		LightspeedMaskedChar = { fg = theme.orange },
		LightspeedOneCharMatch = { bg = theme.magenta, fg = theme.fg, bold = true },
		LightspeedPendingOpArea = { bg = theme.magenta, fg = theme.fg },
		LightspeedShortcut = { bg = theme.magenta, fg = theme.fg, bold = true, underline = true },
		-- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
		-- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
		LightspeedUnlabeledMatch = { fg = theme.blue, bold = true },
		-- CMP
		CmpDocumentation = { fg = theme.fg, bg = theme.bg },
		CmpDocumentationBorder = { fg = theme.border_highlight, bg = theme.bg_popup },
		CmpItemAbbr = { fg = theme.fg, bg = theme.none },
		CmpItemAbbrDeprecated = { fg = theme.blue, bg = theme.none, strikethrough = true },
		CmpItemAbbrMatch = { fg = theme.blue, bg = theme.none },
		CmpItemAbbrMatchFuzzy = { fg = theme.blue, bg = theme.none },
		CmpItemMenu = { fg = theme.comment, bg = theme.none },
		CmpItemKindDefault = { fg = theme.white, bg = theme.none },
		CmpItemKindKeyword = { fg = theme.cyan, bg = theme.none },
		CmpItemKindVariable = { fg = theme.magenta, bg = theme.none },
		CmpItemKindConstant = { fg = theme.magenta, bg = theme.none },
		CmpItemKindReference = { fg = theme.magenta, bg = theme.none },
		CmpItemKindValue = { fg = theme.magenta, bg = theme.none },
		CmpItemKindCopilot = { fg = theme.teal, bg = theme.none },
		CmpItemKindFunction = { fg = theme.blue, bg = theme.none },
		CmpItemKindMethod = { fg = theme.blue, bg = theme.none },
		CmpItemKindConstructor = { fg = theme.blue, bg = theme.none },
		CmpItemKindClass = { fg = theme.orange, bg = theme.none },
		CmpItemKindInterface = { fg = theme.orange, bg = theme.none },
		CmpItemKindStruct = { fg = theme.orange, bg = theme.none },
		CmpItemKindEvent = { fg = theme.orange, bg = theme.none },
		CmpItemKindEnum = { fg = theme.orange, bg = theme.none },
		CmpItemKindUnit = { fg = theme.orange, bg = theme.none },
		CmpItemKindModule = { fg = theme.yellow, bg = theme.none },
		CmpItemKindProperty = { fg = theme.green, bg = theme.none },
		CmpItemKindField = { fg = theme.green, bg = theme.none },
		CmpItemKindTypeParameter = { fg = theme.green, bg = theme.none },
		CmpItemKindEnumMember = { fg = theme.green, bg = theme.none },
		CmpItemKindOperator = { fg = theme.green, bg = theme.none },
		CmpItemKindSnippet = { fg = theme.black, bg = theme.none },
		-- navic
		NavicIconsFile = { fg = theme.fg, bg = theme.none },
		NavicIconsModule = { fg = theme.yellow, bg = theme.none },
		NavicIconsNamespace = { fg = theme.fg, bg = theme.none },
		NavicIconsPackage = { fg = theme.fg, bg = theme.none },
		NavicIconsClass = { fg = theme.orange, bg = theme.none },
		NavicIconsMethod = { fg = theme.blue, bg = theme.none },
		NavicIconsProperty = { fg = theme.green1, bg = theme.none },
		NavicIconsField = { fg = theme.green1, bg = theme.none },
		NavicIconsConstructor = { fg = theme.orange, bg = theme.none },
		NavicIconsEnum = { fg = theme.orange, bg = theme.none },
		NavicIconsInterface = { fg = theme.orange, bg = theme.none },
		NavicIconsFunction = { fg = theme.blue, bg = theme.none },
		NavicIconsVariable = { fg = theme.magenta, bg = theme.none },
		NavicIconsConstant = { fg = theme.magenta, bg = theme.none },
		NavicIconsString = { fg = theme.green, bg = theme.none },
		NavicIconsNumber = { fg = theme.orange, bg = theme.none },
		NavicIconsBoolean = { fg = theme.orange, bg = theme.none },
		NavicIconsArray = { fg = theme.orange, bg = theme.none },
		NavicIconsObject = { fg = theme.orange, bg = theme.none },
		NavicIconsKey = { fg = theme.purple, bg = theme.none },
		NavicIconsKeyword = { fg = theme.purple, bg = theme.none },
		NavicIconsNull = { fg = theme.orange, bg = theme.none },
		NavicIconsEnumMember = { fg = theme.green, bg = theme.none },
		NavicIconsStruct = { fg = theme.orange, bg = theme.none },
		NavicIconsEvent = { fg = theme.orange, bg = theme.none },
		NavicIconsOperator = { fg = theme.fg, bg = theme.none },
		NavicIconsTypeParameter = { fg = theme.green, bg = theme.none },
		NavicText = { fg = theme.fg, bg = theme.none },
		NavicSeparator = { fg = theme.fg, bg = theme.none },
		-- ident balnkline
		IndentBlanklineChar = { fg = theme.fg_gutter, nocombine = true },
		IndentBlanklineContextChar = { fg = theme.purple, nocombine = true },
		-- scrollbar

		ScrollbarHandle = { fg = theme.none, bg = theme.bg_highlight },
		ScrollbarSearchHandle = { fg = theme.orange, bg = theme.bg_highlight },
		ScrollbarSearch = { fg = theme.orange, bg = theme.none },
		ScrollbarErrorHandle = { fg = theme.error, bg = theme.bg_highlight },
		ScrollbarError = { fg = theme.error, bg = theme.none },
		ScrollbarWarnHandle = { fg = theme.warning, bg = theme.bg_highlight },
		ScrollbarWarn = { fg = theme.warning, bg = theme.none },
		ScrollbarInfoHandle = { fg = theme.info, bg = theme.bg_highlight },
		ScrollbarInfo = { fg = theme.info, bg = theme.none },
		ScrollbarHintHandle = { fg = theme.hint, bg = theme.bg_highlight },
		ScrollbarHint = { fg = theme.hint, bg = theme.none },
		ScrollbarMiscHandle = { fg = theme.purple, bg = theme.bg_highlight },
		ScrollbarMisc = { fg = theme.purple, bg = theme.none },
		-- Lazy
		LazyProgressDone = { bold = true, fg = theme.magenta },
		LazyProgressTodo = { bold = true, fg = theme.fg_gutter },
		-- Notify
		--- Border
		NotifyERRORBorder = { fg = theme.error, bg = theme.bg_popup },
		NotifyWARNBorder = { fg = theme.warning, bg = theme.bg_popup },
		NotifyINFOBorder = { fg = theme.info, bg = theme.bg_popup },
		NotifyDEBUGBorder = { fg = theme.comment, bg = theme.bg_popup },
		NotifyTRACEBorder = { fg = theme.purple, bg = theme.bg_popup },
		--- Icons
		NotifyERRORIcon = { fg = theme.error },
		NotifyWARNIcon = { fg = theme.warning },
		NotifyINFOIcon = { fg = theme.info },
		NotifyDEBUGIcon = { fg = theme.comment },
		NotifyTRACEIcon = { fg = theme.purple },
		--- Title
		NotifyERRORTitle = { fg = theme.error },
		NotifyWARNTitle = { fg = theme.warning },
		NotifyINFOTitle = { fg = theme.info },
		NotifyDEBUGTitle = { fg = theme.comment },
		NotifyTRACETitle = { fg = theme.purple },
		--- Body
		NotifyERRORBody = { fg = theme.fg, bg = theme.bg_popup },
		NotifyWARNBody = { fg = theme.fg, bg = theme.bg_popup },
		NotifyINFOBody = { fg = theme.fg, bg = theme.bg_popup },
		NotifyDEBUGBody = { fg = theme.fg, bg = theme.bg_popup },
		NotifyTRACEBody = { fg = theme.fg, bg = theme.bg_popup },
	}

	utils.highlight(groups)
end

return M
