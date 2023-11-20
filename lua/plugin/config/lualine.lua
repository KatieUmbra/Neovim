local custom_rose_pine = require("lualine.themes.rose-pine")
local color_bg_dark = "#202035"
local color_bg_light = "#393552"

local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
for _, mode in ipairs(modes) do
	custom_rose_pine[mode].c.bg = color_bg_dark
	custom_rose_pine[mode].b.bg = color_bg_light
end

require("lualine").setup({
	options = {
		-- theme = custom_rose_pine,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {
			startup = {},
			oil = {},
			TelescopePrompt = {},
		},
	},
})
