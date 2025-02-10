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

local settings = require("settings")
M.colors = M[settings.colorscheme][settings.variant]

return M
