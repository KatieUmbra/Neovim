local M = {}

M.rosepineColors = {
	["Red"] = { color = "eb6f92", id = 1 },
	["Yellow"] = { color = "f6c177", id = 2 },
	["Blue"] = { color = "9ccfd8", id = 3 },
	["Orange"] = { color = "ebbcba", id = 4 },
	["Green"] = { color = "56bf9f", id = 5 },
	["Violet"] = { color = "c4a7e7", id = 6 },
	["Cyan"] = { color = "3e8fb0", id = 7 },
}

M.carbonfoxColors = {
	["Red"] = { color = "ee5396", id = 1 },
	["Yellow"] = { color = "08bdba", id = 2 },
	["Blue"] = { color = "78a9ff", id = 3 },
	["Orange"] = { color = "3ddbd9", id = 4 },
	["Green"] = { color = "25be6a", id = 5 },
	["Violet"] = { color = "be95ff", id = 6 },
	["Cyan"] = { color = "33b1ff", id = 7 },
}

local settings = require("settings")
M.colors = M[settings.colorscheme .. "Colors"]

return M
