local colors = require("tokyogogh.config").theme
local config = require("tokyogogh.config").options

local tokyogogh = {}

tokyogogh.normal = {
	a = { bg = colors.blue, fg = colors.bg_statusline },
	b = { bg = colors.fg_gutter, fg = colors.blue },
	c = { bg = colors.bg_statusline, fg = colors.fg_statusline },
}

tokyogogh.insert = {
	a = { bg = colors.green, fg = colors.bg_statusline },
	b = { bg = colors.fg_gutter, fg = colors.green },
}

tokyogogh.command = {
	a = { bg = colors.yellow, fg = colors.bg_statusline },
	b = { bg = colors.fg_gutter, fg = colors.yellow },
}

tokyogogh.visual = {
	a = { bg = colors.magenta, fg = colors.bg_statusline },
	b = { bg = colors.fg_gutter, fg = colors.yellow },
}

tokyogogh.replace = {
	a = { bg = colors.red, fg = colors.bg_statusline },
	b = { bg = colors.fg_gutter, fg = colors.red },
}

tokyogogh.terminal = {
	a = { bg = colors.orange, fg = colors.bg_statusline },
	b = { bg = colors.fg_gutter, fg = colors.orange },
}

tokyogogh.inactive = {
	a = { bg = colors.bg_statusline, fg = colors.orange },
	b = { bg = colors.bg_statusline, fg = colors.black, gui = "bold" },
	c = { bg = colors.bg_statusline, fg = colors.black },
}

if config.lualine_bold then
	for _, mode in pairs(tokyogogh) do
		mode.a.gui = "bold"
	end
end

if vim.g.tokyogogh == nil then
	vim.g.tokyogogh = true
end

return tokyogogh
