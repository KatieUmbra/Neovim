require("rainbow-delimiters.setup") {
	highlight = {
		'RainbowDelimiterRed',
        'RainbowDelimiterOrange',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterGreen',
	}
}

local function setColor(rdColor, themeColor)
	local cmd = [[:silent! highlight RainbowDelimiter]]..rdColor..[[ guifg=#]]..themeColor
	vim.cmd(cmd)
end

local rosepineColors = {
	["Red"] = "eb6f92",
	["Yellow"] = "f6c177",
	["Blue"] = "9ccfd8",
	["Orange"] = "ebbcba",
	["Green"] = "56bf9f",
	["Violet"] = "c4a7e7",
	["Cyan"] = "3e8fb0"
}

function SetColors(colorscheme)
	for i, k in pairs(colorscheme) do
		setColor(i, k)
	end
end

SetColors(rosepineColors)
