local M = {}

M.bg = "#000000"
M.fg = "#ffffff"
M.day_brightness = 0.3

---@param c string
function M.hex2Rgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

-- Add highlights
---@param groups table
function M.highlight(groups)
	if not groups then
		return
	end

	for group, settings in pairs(groups) do
		if settings.style then
			if type(settings.style) == "table" then
				settings = vim.tbl_extend("force", settings, settings.style)
			elseif settings.style.lower() ~= "none" then
				for s in string.gmatch(settings.style, "([^,]+)") do
					settings[s] = true
				end
			end
			settings.style = nil
		end

		vim.api.nvim_set_hl(0, group, settings)
	end
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, background, alpha)
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local bg = M.hex2Rgb(background)
	local fg = M.hex2Rgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
	return M.blend(hex, bg or M.bg, amount)
end

function M.lighten(hex, amount, fg)
	return M.blend(hex, fg or M.fg, amount)
end

return M
