local colors = require("tokyogogh.config").theme
local config = require("tokyogogh.config").options

local M = {
	normal = { bg = colors.bg_breadcrumb, fg = colors.fg_breadcrumb },

	ellipsis = { fg = colors.fg_breadcrumb },
	separator = { fg = colors.fg_breadcrumb },
	modified = { fg = colors.warning },

	dirname = { fg = colors.dark5 },
	basename = { fg = colors.fg_breadcrumb, bold = true },
	context = { fg = colors.fg_breadcrumb },

	context_file = { fg = colors.fg_breadcrumb },
	context_module = { fg = colors.yellow },
	context_namespace = { fg = colors.yellow },
	context_package = { fg = colors.blue },
	context_class = { fg = colors.orange },
	context_method = { fg = colors.blue },
	context_property = { fg = colors.green },
	context_field = { fg = colors.green },
	context_constructor = { fg = colors.blue },
	context_enum = { fg = colors.orange },
	context_interface = { fg = colors.orange },
	context_function = { fg = colors.blue },
	context_variable = { fg = colors.magenta },
	context_constant = { fg = colors.magenta },
	context_string = { fg = colors.green },
	context_number = { fg = colors.orange },
	context_boolean = { fg = colors.orange },
	context_array = { fg = colors.orange },
	context_object = { fg = colors.orange },
	context_key = { fg = colors.purple },
	context_null = { fg = colors.blue },
	context_enum_member = { fg = colors.green },
	context_struct = { fg = colors.orange },
	context_event = { fg = colors.orange },
	context_operator = { fg = colors.green },
	context_type_parameter = { fg = colors.green },
}

return M
