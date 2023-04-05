local utils = require("tokyogogh.utils")
local colors = require("tokyogogh.colors")

local M = {}

M.options = {}

function M.set_theme(name)
	if name == "storm" then
		require("tokyogogh.colors").theme = colors.storm
	elseif name == "night" then
		require("tokyogogh.colors").theme = colors.night
	else
		require("tokyogogh.colors").theme = colors.storm
	end
end

function M.set_terminal_colors()
	local theme = require("tokyogogh.colors").theme

	vim.g.terminal_color_0 = theme.black
	vim.g.terminal_color_8 = theme.black

	vim.g.terminal_color_1 = theme.red
	vim.g.terminal_color_9 = theme.red

	vim.g.terminal_color_2 = theme.green
	vim.g.terminal_color_10 = theme.green

	vim.g.terminal_color_3 = theme.yellow
	vim.g.terminal_color_11 = theme.yellow

	vim.g.terminal_color_4 = theme.blue
	vim.g.terminal_color_12 = theme.blue

	vim.g.terminal_color_5 = theme.magenta
	vim.g.terminal_color_13 = theme.magenta

	vim.g.terminal_color_6 = theme.cyan
	vim.g.terminal_color_14 = theme.cyan

	vim.g.terminal_color_7 = theme.white
	vim.g.terminal_color_15 = theme.white
end

M.load_groups = function()
	local groups = require("tokyogogh.groups")

	utils.highlight(groups)
end

return M
