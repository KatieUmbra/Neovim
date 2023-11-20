local function setColor(name, color)
	vim.api.nvim_set_hl(0, "Rainbow" .. name, { fg = "#" .. string.upper(color) })
end

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	for n, v in pairs(require("options.color").colors) do
		setColor(n, v.color)
	end
end)

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

require("ibl").setup({
	indent = { highlight = highlight },
	scope = { highlight = highlight },
})
