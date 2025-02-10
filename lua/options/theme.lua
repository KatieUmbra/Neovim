--[[
require("rose-pine").setup({
	variant = "moon",
	dark_variant = "moon",
})

vim.cmd("colorscheme rose-pine")

vim.cmd("colorscheme carbonfox")

require("onedark").setup({
	style = "dark",
})
require("onedark").load()
--]]

local colorschemes = {
	["rosepine"] = {
		["default"] = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
			})
			vim.cmd([[ colorscheme rose-pine ]])
		end,
		["moon"] = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
			})
			vim.cmd([[ colorscheme rose-pine ]])
		end,
		["dawn"] = function()
			require("rose-pine").setup({
				variant = "dawn",
				dark_variant = "dawn",
			})
			vim.cmd([[ colorscheme rose-pine ]])
		end,
	},
	["carbonfox"] = {
		["default"] = function()
			vim.cmd([[ colorscheme carbonfox ]])
		end,
	},
}

local settings = require("settings")
colorschemes[settings.colorscheme][settings.variant]()

vim.opt.background = "dark"
