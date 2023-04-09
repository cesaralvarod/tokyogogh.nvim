local config = require("tokyogogh.config")
local groups = require("tokyogogh.groups")

local M = {}

local default_config = {
	style = "storm", -- storm | night
	term_colors = true,

	-- Change code styles
	code_styles = {
		comment = { italic = true, bold = false },
		constant = { italic = false, bold = false },
		string = { italic = false, bold = false },
		character = { italic = false, bold = false },
		number = { italic = false, bold = false },
		boolean = { italic = false, bold = false },
		float = { italic = false, bold = false },
		identifier = { italic = false, bold = false },
		functions = { italic = false, bold = false },
		statement = { italic = false, bold = false },
		conditional = { italic = false, bold = false },
		repeats = { italic = false, bold = false },
		label = { italic = false, bold = false },
		operator = { italic = false, bold = false },
		keyword = { italic = false, bold = false },
		exception = { italic = false, bold = false },
		preproc = { italic = false, bold = false },
		include = { italic = false, bold = false },
		define = { italic = false, bold = false },
		macro = { italic = false, bold = false },
		precondit = { italic = false, bold = false },
		type = { italic = false, bold = false },
		storageclass = { italic = false, bold = false },
		structure = { italic = false, bold = false },
		typedef = { italic = false, bold = false },
		special = { italic = false, bold = false },
		specialchar = { italic = false, bold = false },
		tag = { italic = false, bold = false },
		delimiter = { italic = false, bold = false },
		specialcomment = { italic = false, bold = false },
		debugs = { italic = false, bold = false },
		underlined = { italic = false, bold = false, underline = true },
		bold = { italic = false, bold = true },
		italic = { italic = true, bold = false },
		ignore = { italic = false, bold = false },
		error = { italic = false, bold = false },
		todo = { italic = false, bold = false },
	},

	diagnostics = {
		undercurl = true, -- use undercurl instead of underline
		background = true,
	},

	colors = {},
	highlight = {},
}

function M._load(theme)
	local local_options = {
		style = theme,
	}

	config.set_theme(theme)
	config.options = vim.tbl_deep_extend("force", {}, default_config, local_options or {})

	groups.load(config.theme)
end

function M.setup(opts)
	if vim.version().minor < 7 then
		vim.notify("tokyogogh: you must use neovim 0.7 or higher")
	end

	config.options = vim.tbl_deep_extend("force", {}, default_config, opts or {})

	if vim.g.colors_name then
		vim.cmd.hi("clear")
	end

	if vim.fn.exists("syntax_on") then
		vim.cmd([[syntax reset]])
	end

	if config.options.term_colors then
		vim.o.termguicolors = true
		config.set_terminal_colors()
	end

	vim.o.background = "dark"
	vim.g.colors_name = "tokyogogh"

	config.set_theme(config.options.style)

	groups.load(config.theme)
end

return M
