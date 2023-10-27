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

local function setColor(rdColor, themeColor)
	local cmd = [[:silent! highlight RainbowDelimiter]] .. rdColor .. [[ guifg=#]] .. themeColor
	vim.cmd(cmd)
end

local function SetColors(colorscheme)
	for i, k in pairs(colorscheme) do
		setColor(i, k.color)
	end
end

SetColors(require("options.color").rosepineColors)
