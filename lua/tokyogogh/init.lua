local config = require("tokyogogh.config")
local groups = require("tokyogogh.groups")

local M = {}

local default_config = {
	style = "storm", -- storm | night
	term_colors = true,

	-- Change code styles
	code_styles = {
		strings = { italic = false, bold = false },
		comments = { italic = true, bold = false },
		functions = { italic = false, bold = false },
		variables = { italic = false, bold = false },
	},

	diagnostics = {
		undercurl = true, -- use undercurl instead of underline
		background = true,
	},

	colors = {},
	highlight = {},
}

function M._load(theme)
	config.set_theme(theme)

	groups.load(config.theme)
end

function M.setup(opts)
	if vim.version().minor < 8 then
		vim.notify("tokyogogh: you must use neovim 0.8 or higher")
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
