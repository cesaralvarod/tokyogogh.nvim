local utils = require("tokyogogh.utils")

local M = {}

function M.load(theme)
	local options = require("tokyogogh.config").options

	local groups = {
		Foo = { bg = theme.magenta, fg = theme.magenta },
		ColorColumn = { bg = theme.black }, -- used for the colums set with 'colorcolumn'
		Conceal = { fg = theme.magenta }, -- placeholder characters substituited for concealed text (see 'conceallevel')
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
		NormalFloat = { fg = theme.fg, bg = theme.bg_popup }, -- normal text in floating windows.
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
		Comment = { fg = theme.comment, style = options.code_styles.comment }, -- any comment
		Constant = { fg = theme.orange, style = options.code_styles.constant }, -- any constant (preferred group)
		String = { fg = theme.green, style = options.code_styles.string }, -- a string constant: "this is a string"
		Character = { fg = theme.cyan, style = options.code_styles.character }, -- a character constant: 'c', '\n'
		Number = { link = "Constant", style = options.code_styles.number }, -- a number constant: 234, 0xff
		Boolean = { link = "Constant", style = options.code_styles.boolean }, -- a boolean constant: TRUE, false
		Float = { link = "Constant", style = options.code_styles.floar }, -- a floating point constant = 2.3e10

		Identifier = { fg = theme.red, style = options.code_styles.identifier }, -- any variable name (preferred group)
		Function = { fg = theme.blue, style = options.code_styles.functions }, -- function name (also: methods for classes)
		Statement = { fg = theme.magenta, style = options.code_styles.statement }, -- any statement(preferred group)
		Conditional = { fg = theme.magenta, style = options.code_styles.conditional }, -- if, then, else, endif, switch, etc.
		Repeat = { fg = theme.magenta, style = options.code_styles.repeats }, -- for, do, while, etc.
		Label = { link = "Identifier", style = options.code_styles.label }, -- case, default, etc.
		Operator = { fg = theme.cyan, style = options.code_styles.operator }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = theme.magenta, style = options.code_styles.keyword }, -- any other keyword
		Exception = { fg = theme.magenta, style = options.code_styles.exception }, -- try, catch, throw

		PreProc = { fg = theme.cyan, style = options.code_styles.preproc }, -- generic Preprocessor (preferred group)
		Include = { fg = theme.magenta, style = options.code_styles.include }, -- preprocessor #include
		Define = { link = "PreProc", style = options.code_styles.define }, -- preprocessor #define
		Macro = { link = "PreProc", style = options.code_styles.macro }, -- same as Define
		PreCondit = { link = "PreProc", style = options.code_styles.precondit }, -- preprocessor #if, #else, #endif, etc.

		Type = { fg = theme.yellow, style = options.code_styles.type }, -- int, long, char, etc. (preferred group)
		StorageClass = { fg = theme.magenta, style = options.code_styles.storageclass }, -- static, register, volatile, etc.
		Structure = { link = "Type", style = options.code_styles.structure }, -- struct, union, enum, etc.
		Typedef = { link = "Type", style = options.code_styles.typedef }, -- A typedef

		Special = { fg = theme.orange, style = options.code_styles.special }, -- any special symbol (preffered group)
		SpecialChar = { fg = theme.cyan, style = options.code_styles.typedef }, -- special character in a constant
		Tag = { fg = theme.red, style = options.code_styles.tag }, -- you can user CTRL-] on this
		Delimiter = { fg = theme.white, style = options.code_styles.delimiter }, -- character that needs attention
		SpecialComment = { link = "Special", style = options.code_styles.specialcomment }, -- sepecial things inside a comment
		Debug = { link = "Special", style = options.code_styles.debugs }, -- debugging statements

		Underlined = { fg = theme.magenta, style = options.code_styles.underlined }, -- text that standa out, HTML links (preferred group)
		Bold = { style = options.code_styles.bold },
		Italic = { style = options.code_styles.italic },

		Ignore = { fg = theme.none, style = options.code_styles.ignore }, -- left blank, hidden, hl-Ignore (preferred group)
		Error = { fg = theme.error, style = options.code_styles.error }, -- any erroneus construct (preferred group)
		Todo = { fg = theme.bg, bg = theme.yellow, style = options.code_styles.todo }, -- anything that needs extra attention; mostly the keywords TODO, FIXME and XXX (preferred group)

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

		-- text
		["@text.html"] = { fg = theme.white },
		["@text.literal"] = { fg = theme.green },
		["@text.reference"] = { fg = theme.blue },
		["@text.title"] = { fg = theme.red, bold = true },
		["@text.title.html"] = { fg = theme.white },
		["@text.uri"] = { fg = theme.green, underline = true },
		["@text.underline"] = { fg = theme.green, underline = true },
		["@text.todo"] = { link = "Todo" },
		["@text.strong"] = { fg = theme.orange, bold = true },
		["@text.emphasis"] = { fg = theme.magenta, italic = true },
		["@text.strike"] = { strikethrough = true },
		["@text.quote"] = { fg = theme.comment },
		["@text.todo.unchecked"] = {},
		["@text.todo.checked"] = {},
		["@text.warning"] = {},
		["@text.danger"] = {},
		["@text.diff.add"] = { link = "DiffAdd" },
		["@text.diff.delete"] = { link = "DiffDelete" },
		--
		["@conceal"] = { link = "Conceal" },
		["@conceal.json"] = { fg = theme.none },
		["@conceal.jsonc"] = { fg = theme.none },

		-- miscs
		["@comment"] = { link = "Comment" },
		--
		["@comment.documentation"] = { link = "String", style = options.code_styles.comment },
		["@comment.documentation.javascript"] = { link = "Comment" },
		["@comment.documentation.typescript"] = { link = "Comment" },
		["@comment.documentation.tsx"] = { link = "Comment" },
		["@comment.documentation.lua"] = { link = "Comment" },
		["@comment.documentation.go"] = { link = "Comment" },
		--
		["@punctuation"] = { link = "Delimiter" },
		--
		["@punctuation.delimiter"] = { link = "@punctuation" },
		["@punctuation.delimiter.css"] = { fg = theme.cyan, style = options.code_styles.delimiter },
		["@punctuation.delimiter.markdown"] = { fg = theme.orange, bold = true },
		--
		["@punctuation.bracket"] = { fg = theme.rainbowc1, style = options.code_styles.delimiter },
		--
		["@punctuation.special"] = { fg = theme.cyan, style = options.code_styles.delimiter },
		["@punctuation.special.markdown"] = { fg = theme.red, style = options.code_styles.delimiter },
		["@punctuation.special.vue"] = { fg = theme.rainbowc1, style = options.code_styles.delimiter },
		["@punctuation.special.bash"] = { fg = theme.red, style = options.code_styles.delimiter },
		-- [" "#e08f68@punctuation.special.markdown"] = { fg = theme.red },

		-- constants
		["@constant"] = { fg = theme.yellow, style = options.code_styles.constant },
		["@constant.python"] = { fg = theme.orange, style = options.code_styles.constant },
		["@constant.bash"] = { fg = theme.red, style = options.code_styles.constant },
		["@constant.lua"] = { fg = theme.red, style = options.code_styles.constant },
		["@constant.html"] = { fg = theme.red, style = options.code_styles.constant },
		["@constant.gitignore"] = { fg = theme.white, style = options.code_styles.constant },
		--
		["@constant.builtin"] = { link = "Special" },
		["@constant.builtin.python"] = { fg = theme.red, style = options.code_styles.special },
		--
		["@constant.macro"] = { link = "Define" },
		--
		["@define"] = { link = "Define" },
		--
		["@macro"] = { link = "Macro" },
		--
		["@string"] = { link = "String" },
		--
		["@string.regex"] = { link = "String" },
		--
		["@string.escape"] = { link = "SpecialChar" },
		--
		["@string.special"] = { link = "SpecialChar" },
		--
		["@character"] = { link = "Character" },
		["@character.c"] = { fg = theme.green, style = options.code_styles.character },
		--
		["@character.special"] = { link = "SpecialChar" },
		--
		["@number"] = { link = "Number" },
		["@number.dockerfile"] = { fg = theme.red, style = options.code_styles.number },
		--
		["@boolean"] = { link = "Boolean" },
		--
		["@float"] = { link = "Float" },

		-- functions
		["@function"] = { link = "Function" },
		["@function.css"] = { fg = theme.cyan, style = options.code_styles.functions },
		--
		["@function.builtin"] = { fg = theme.cyan, style = options.code_styles.functions },
		--
		["@function.macro"] = { link = "Macro" },
		--
		["@function.call"] = { fg = theme.blue, style = options.code_styles.functions },
		["@function.call.bash"] = { fg = theme.white, style = options.code_styles.functions },
		["@function.call.c"] = { fg = theme.blue, italic = false },
		["@function.call.cpp"] = { fg = theme.blue, italic = false },
		--
		["@parameter"] = { fg = theme.red, italic = true },
		["@parameter.lua"] = { fg = theme.white, italic = true },
		["@parameter.python"] = { fg = theme.orange, italic = true },
		["@parameter.bash"] = { fg = theme.red, italic = false },
		--
		["@parameter.builtin"] = { fg = theme.white },
		--
		["@method"] = { link = "Function" },
		--
		["@method.call"] = { link = "Function" },
		--
		["@field"] = { link = "Identifier" },
		["@field.lua"] = { fg = theme.white, style = options.code_styles.identifier },
		["@field.cpp"] = { fg = theme.white, style = options.code_styles.identifier },
		["@field.python"] = { fg = theme.white, style = options.code_styles.identifier },
		["@field.go"] = { fg = theme.white, style = options.code_styles.identifier },
		--
		["@property"] = { fg = theme.cyan, style = options.code_styles.identifier },
		["@property.css"] = { fg = theme.white, style = options.code_styles.identifier },
		["@property.scss"] = { fg = theme.white, style = options.code_styles.identifier },
		--
		["@property.bultin"] = { fg = theme.cyan, style = options.code_styles.identifier },
		--
		["@constructor"] = { link = "Special" },
		["@constructor.tsx"] = { fg = theme.yellow, style = options.code_styles.special },
		["@constructor.typescript"] = { fg = theme.yellow, style = options.code_styles.special },
		["@constructor.javascript"] = { fg = theme.yellow, style = options.code_styles.special },
		["@constructor.lua"] = { fg = theme.magenta, style = options.code_styles.special }, -- {} brackets

		-- keywords
		["@conditional"] = { link = "Conditional" },
		["@conditional.python"] = { fg = theme.magenta, italic = true },
		--
		["@repeat"] = { link = "Repeat" },
		["@repeat.python"] = { fg = theme.magenta, italic = true },
		--
		["@label"] = { link = "Label" },
		["@label.lua"] = { fg = theme.white, style = options.code_styles.label },
		--
		["@operator"] = { link = "Operator" },
		["@operator.cpp"] = { fg = theme.magenta, style = options.code_styles.operator },
		["@operator.c"] = { fg = theme.magenta, style = options.code_styles.operator },
		["@operator.lua"] = { fg = theme.white, style = options.code_styles.operator },
		["@operator.python"] = { fg = theme.cyan, style = options.code_styles.operator },
		--
		["@keyword"] = { link = "Keyword" },
		["@keyword.python"] = { fg = theme.magenta, italic = true },
		--
		-- ["@keyword.coroutine"] = { }, -- For keywords related to coroutines.
		--
		["@keyword.function"] = { link = "Keyword" },
		--
		["@keyword.operator"] = { fg = theme.magenta, style = options.code_styles.keyword },
		["@keyword.operator.php"] = { fg = theme.magenta, style = options.code_styles.keyword },
		--
		["@exception"] = { link = "Exception" },
		["@exception.python"] = { fg = theme.magenta, italic = true },
		--
		["@variable"] = { link = "Identifier" },
		["@variable.astro"] = { fg = theme.magenta, style = options.code_styles.identifier },
		["@variable.cpp"] = { fg = theme.white, style = options.code_styles.identifier },
		["@variable.c"] = { fg = theme.white, style = options.code_styles.identifier },
		["@variable.python"] = { fg = theme.white, style = options.code_styles.identifier },
		["@variable.go"] = { fg = theme.white, style = options.code_styles.identifier },
		--
		["@variable.builtin"] = { fg = theme.yellow, style = options.code_styles.identifier },
		["@variable.builtin.lua"] = { fg = theme.cyan, style = options.code_styles.identifier },
		--
		["@type"] = { link = "Type" },
		["@type.python"] = { fg = theme.cyan, style = options.code_styles.type },
		["@type.css"] = { fg = theme.red, style = options.code_styles.type },
		["@type.scss"] = { fg = theme.red, style = options.code_styles.type },
		["@type.sql"] = { fg = theme.blue, style = options.code_styles.type },
		--
		["@type.definition"] = { link = "Typedef" },
		--
		["@type.builtin"] = { link = "Type" },
		["@type.builtin.python"] = { fg = theme.cyan, style = options.code_styles.type },
		["@type.builtin.cpp"] = { fg = theme.magenta, style = options.code_styles.type },
		["@type.builtin.c"] = { fg = theme.magenta, style = options.code_styles.type },
		["@type.builtin.go"] = { fg = theme.magenta, style = options.code_styles.type },
		["@type.builtin.java"] = { fg = theme.magenta, style = options.code_styles.type },
		--
		["@type.qualifier"] = { link = "Type" },
		["@type.qualifier.cpp"] = { fg = theme.magenta, style = options.code_styles.type },
		["@type.qualifier.c"] = { fg = theme.magenta, style = options.code_styles.type },
		["@type.qualifier.php"] = { fg = theme.magenta, style = options.code_styles.type },
		["@type.qualifier.java"] = { fg = theme.magenta, style = options.code_styles.type },
		--
		["@storageclass"] = { link = "StorageClass" },
		--
		["@namespace"] = { link = "Identifier" }, -- Identifier
		["@namespace.cpp"] = { fg = theme.yellow, style = options.code_styles.identifier },
		["@namespace.c"] = { fg = theme.yellow, style = options.code_styles.identifier },
		["@namespace.php"] = { fg = theme.yellow, style = options.code_styles.identifier },
		--
		["@include"] = { link = "Include" },
		["@include.python"] = { fg = theme.magenta, italic = true },
		--
		["@preproc"] = { link = "PreProc" },
		["@preproc.lua"] = { fg = theme.comment, italic = true },
		["@preproc.bash"] = { fg = theme.comment, italic = true },
		--
		["@debug"] = { link = "Debug" },
		--
		["@attribute"] = { fg = theme.magenta, style = options.code_styles.keyword },
		--
		["@tag"] = { link = "Tag" },
		--
		-- ["@tag.builtin.tsx"] = { fg = theme.yellow },
		--
		["@tag.attribute"] = { fg = theme.blue, italic = true },
		-- ["@tag.attribute.html"] = { fg = theme.blue, italic = false },
		--
		["@tag.delimiter"] = { fg = theme.white },
		--
		["@identifier"] = { link = "Identifier" },
		-- ["@identifier.astro"] = { fg = theme.magenta },

		--LSP semantic tokens

		-- Types: namespace, class, type, enum, enumMember, interface, struct, typeParameter, parameter, variable, property, event, function, method, macro, keyword, modifier, comment, string, number, regexp, operator, decorator
		["@lsp.type.class"] = { link = "@type" },
		-- ["@lsp.type.event"] = {}, -- not used
		-- ["@lsp.type.python"] = { link = "@type.python" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.decorator"] = { link = "@keyword" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@property" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.interface"] = { link = "@type" },
		["@lsp.type.macro"] = { link = "@macro" },
		["@lsp.type.method"] = { link = "@method" },
		-- ["@lsp.type.modifier"] = {}, -- not used
		["@lsp.type.namespace"] = { fg = theme.yellow },
		["@lsp.type.namespace.c"] = { link = "@namespace.c" },
		["@lsp.type.namespace.cpp"] = { link = "@namespace.cpp" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.property.lua"] = { link = "@field.lua" },
		["@lsp.type.property.c"] = { link = "@field.c" },
		["@lsp.type.property.cpp"] = { link = "@field.cpp" },
		["@lsp.type.struct"] = { link = "@property" },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.typeParameter"] = { link = "@type" },
		["@lsp.type.variable"] = { link = "@variable" },
		["@lsp.type.variable.c"] = { link = "@variable.c" },
		["@lsp.type.variable.cpp"] = { link = "@variable.cpp" },
		-- Typemods: declaration, definition, readonly, static, deprected, abstract, async, modifiction, documentation, defaultLibrary
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.defaultLibrary.cpp"] = { fg = theme.white },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },
		-- ["@lsp.typemod.variable.globalScope"] (global variables)
		["@lsp.mod.deprecated"] = { strikethrough = true },

		-- More highlight

		["htmlTag"] = { fg = theme.white },
		["htmlEndTag"] = { fg = theme.white },
		["htmlTagN"] = { fg = theme.red },
		["htmlTagName"] = { fg = theme.red },
		["htmlArg"] = { fg = theme.blue, italic = true },
		["htmlSpecialTagName"] = { fg = theme.red },
		["htmlTitle"] = { fg = theme.white },

		["javascript"] = { fg = theme.red },
		["javascriptIdentifier"] = { fg = theme.magenta },
		["javascriptValue"] = { fg = theme.orange },
		["javascriptNumber"] = { fg = theme.orange },
		["javascriptFunction"] = { fg = theme.magenta },
		["javascriptParens"] = { fg = theme.rainbowc1 },
		["javascriptBraces"] = { fg = theme.rainbowc1 },
		["javascriptReserved"] = { fg = theme.magenta },
		["javascriptStringS"] = { fg = theme.green },

		["typescriptImport"] = { fg = theme.magenta },
		["typescriptIdentifier"] = { fg = theme.yellow },
		["typescriptIdentifierName"] = { fg = theme.yellow },
		["typescriptTypeReference"] = { fg = theme.yellow },
		["typescriptBlock"] = { fg = theme.red },
		["typescriptBraces"] = { fg = theme.rainbowc1 },
		["typescriptParens"] = { fg = theme.rainbowc1 },
		["typescriptExport"] = { fg = theme.magenta },
		["typescriptString"] = { fg = theme.green },
		["typescriptVariable"] = { fg = theme.magenta },
		["typescriptVariableDeclaration"] = { fg = theme.red },
		["typescriptImportType"] = { fg = theme.magenta },
		["typescriptAssign"] = { fg = theme.cyan },
		["typescriptFuncTypeArrow"] = { fg = theme.cyan },
		["typescriptFuncName"] = { fg = theme.blue },
		["typescriptDecorator"] = { fg = theme.blue },
		["typescriptObjectType"] = { fg = theme.cyan },
		["typescriptMember"] = { fg = theme.blue },
		["typescriptHeadersMethod"] = { fg = theme.blue },
		["typescriptTypeBracket"] = { fg = theme.rainbowc3 },
		["typescriptCall"] = { fg = theme.red, italic = true },
		["typescriptInterfaceName"] = { fg = theme.yellow },
		["typescriptCallHeritage"] = { fg = theme.yellow },
		["typescriptClassBlock"] = { fg = theme.blue },
		["typescriptClassName"] = { fg = theme.yellow },
		["typescriptArrowFuncDef"] = { fg = theme.blue },
		["typescriptArrayDestructure"] = { fg = theme.red },
		["typescriptDestructureVariable"] = { fg = theme.red },

		["tsxCloseString"] = { fg = theme.white },
		["tsxAttrib"] = { fg = theme.blue, italic = true },
		["tsxTagName"] = { fg = theme.yellow },
		["tsxRegion"] = { fg = theme.green },

		["jsonQuote"] = { fg = theme.none },
		["jsonKeywordMatch"] = { fg = theme.red },

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
		TSRainbowYellow = { fg = theme.rainbowc1 },
		TSRainbowGreen = { fg = theme.green },
		TSRainbowBlue = { fg = theme.rainbowc3 },
		TSRainbowViolet = { fg = theme.rainbowc2 },
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
		TelescopeNormal = { fg = theme.fg, bg = theme.bg_popup },

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
