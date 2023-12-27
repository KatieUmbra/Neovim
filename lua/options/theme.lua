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
	["rosepine"] = function()
		require("rose-pine").setup({
			variant = "moon",
			dark_variant = "moon",
		})
		vim.cmd([[ colorscheme rose-pine ]])
	end,
	["carbonfox"] = function()
		vim.cmd([[ colorscheme carbonfox ]])
	end,
}

local settings = require("settings")
colorschemes[settings.colorscheme]()

vim.opt.background = "dark"
