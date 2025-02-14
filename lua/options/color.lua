local M = {}

M.rosepine = {
	["default"] = {
		["Red"] = { color = "eb6f92", id = 1 },
		["Yellow"] = { color = "f6c177", id = 2 },
		["Blue"] = { color = "9ccfd8", id = 3 },
		["Orange"] = { color = "ebbcba", id = 4 },
		["Green"] = { color = "31748f", id = 5 },
		["Violet"] = { color = "c4a7e7", id = 6 },
		["Cyan"] = { color = "31748f", id = 7 },
	},
	["moon"] = {
		["Red"] = { color = "eb6f92", id = 1 },
		["Yellow"] = { color = "f6c177", id = 2 },
		["Blue"] = { color = "9ccfd8", id = 3 },
		["Orange"] = { color = "ebbcba", id = 4 },
		["Green"] = { color = "3e8fb0", id = 5 },
		["Violet"] = { color = "c4a7e7", id = 6 },
		["Cyan"] = { color = "3e8fb0", id = 7 },
	},
	["dawn"] = {
		["Red"] = { color = "b4637a", id = 1 },
		["Yellow"] = { color = "ea9d34", id = 2 },
		["Blue"] = { color = "56949f", id = 3 },
		["Orange"] = { color = "d7827e", id = 4 },
		["Green"] = { color = "286983", id = 5 },
		["Violet"] = { color = "907aa9", id = 6 },
		["Cyan"] = { color = "286983", id = 7 },
	},
}

M.carbonfox = {
	["default"] = {
		["Red"] = { color = "ee5396", id = 1 },
		["Yellow"] = { color = "08bdba", id = 2 },
		["Blue"] = { color = "78a9ff", id = 3 },
		["Orange"] = { color = "3ddbd9", id = 4 },
		["Green"] = { color = "25be6a", id = 5 },
		["Violet"] = { color = "be95ff", id = 6 },
		["Cyan"] = { color = "33b1ff", id = 7 },
	},
}

M.catppuccin = {
	["latte"] = {
		["Red"] = { color = "d20f39", id = 1 },
		["Yellow"] = { color = "df8e1d", id = 2 },
		["Blue"] = { color = "04a5e5", id = 3 },
		["Orange"] = { color = "ea76cb", id = 4 },
		["Green"] = { color = "209fb5", id = 5 },
		["Violet"] = { color = "8839ef", id = 6 },
		["Cyan"] = { color = "209fb5", id = 7 },
	},
	["frappe"] = {
		["Red"] = { color = "e7828a", id = 1 },
		["Yellow"] = { color = "e5c890", id = 2 },
		["Blue"] = { color = "99d1db", id = 3 },
		["Orange"] = { color = "f4b8e4", id = 4 },
		["Green"] = { color = "85c1dc", id = 5 },
		["Violet"] = { color = "ca9ee6", id = 6 },
		["Cyan"] = { color = "85c1dc", id = 7 },
	},
	["macchiato"] = {
		["Red"] = { color = "ed8796", id = 1 },
		["Yellow"] = { color = "eed49f", id = 2 },
		["Blue"] = { color = "91d7e3", id = 3 },
		["Orange"] = { color = "f5bde6", id = 4 },
		["Green"] = { color = "7dc4e4", id = 5 },
		["Violet"] = { color = "c6a0f6", id = 6 },
		["Cyan"] = { color = "7dc4e4", id = 7 },
	},
	["mocha"] = {
		["Red"] = { color = "f38ba8", id = 1 },
		["Yellow"] = { color = "f9e2af", id = 2 },
		["Blue"] = { color = "89dceb", id = 3 },
		["Orange"] = { color = "f5c2e7", id = 4 },
		["Green"] = { color = "74c7ec", id = 5 },
		["Violet"] = { color = "cba6f7", id = 6 },
		["Cyan"] = { color = "74c7ec", id = 7 },
	},
}

M.nord = {
	["default"] = {
		["Red"] = { color = "b48ead", id = 1 },
		["Yellow"] = { color = "8fbcbb", id = 2 },
		["Blue"] = { color = "5e81ac", id = 3 },
		["Orange"] = { color = "81a1c1", id = 4 },
		["Green"] = { color = "88c0d0", id = 5 },
		["Violet"] = { color = "b48ead", id = 6 },
		["Cyan"] = { color = "5e81ac", id = 7 },
	},
}

local settings = require("settings")
M.colors = M[settings.colorscheme][settings.variant]

return M
