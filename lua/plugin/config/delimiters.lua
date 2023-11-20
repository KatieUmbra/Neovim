local M = {}

function M.run()
	vim.g.rainbow_delimiters = {
		highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		},
	}
end

function M.setColor(rdColor, themeColor)
	local cmd = [[:silent! highlight RainbowDelimiter]] .. rdColor .. [[ guifg=#]] .. themeColor
	vim.cmd(cmd)
end

function M.SetColors(colorscheme)
	for i, k in pairs(colorscheme) do
		M.setColor(i, k.color)
	end
end

return M
