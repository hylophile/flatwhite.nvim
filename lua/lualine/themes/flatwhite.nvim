local flatwhite = require("flatwhite")
local configs = flatwhite.configs()
local colors = flatwhite.colors()

local bg = configs.lualine_bg_color or colors.base4

local normal = {
	a = { fg = colors.base5, bg = colors.base2, gui = "bold" },
	b = { fg = colors.base2, bg = bg },
	c = { fg = colors.fg, bg = bg },
}

local command = {
	a = { fg = colors.teal_text, bg = colors.teal_bg, gui = "bold" },
	b = { fg = colors.teal_text_sec, bg = bg },
}

local visual = {
	a = { fg = colors.purple_text, bg = colors.purple_bg, gui = "bold" },
	b = { fg = colors.purple_text_sec, bg = bg },
}

local inactive = {
	a = { fg = colors.white, bg = colors.visual, gui = "bold" },
	b = { fg = colors.black, bg = colors.white },
}

local replace = {
	a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
	b = { fg = colors.yellow, bg = bg },
	c = { fg = colors.white, bg = bg },
}

local insert = {
	a = { fg = colors.green_text, bg = colors.green_bg, gui = "bold" },
	b = { fg = colors.green_text_sec, bg = bg },
	c = { fg = colors.fg, bg = bg },
}

return {
	normal = normal,
	command = command,
	visual = visual,
	inactive = inactive,
	replace = replace,
	insert = insert,
}
