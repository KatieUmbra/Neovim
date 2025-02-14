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
			vim.opt.background = "dark"
			vim.cmd([[ colorscheme rose-pine ]])
		end,
		["moon"] = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
			})
			vim.cmd([[ colorscheme rose-pine ]])
			vim.opt.background = "dark"
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
			vim.opt.background = "dark"
		end,
	},
	["catppuccin"] = {
		["latte"] = function()
			vim.cmd([[ colorscheme catppuccin-latte ]])
		end,
		["frappe"] = function()
			vim.cmd([[ colorscheme catppuccin-frappe ]])
			vim.opt.background = "dark"
		end,
		["macchiato"] = function()
			vim.cmd([[ colorscheme catppuccin-macchiato ]])
			vim.opt.background = "dark"
		end,
		["mocha"] = function()
			vim.cmd([[ colorscheme catppuccin-mocha ]])
			vim.opt.background = "dark"
		end,
	},
    ["nord"] = {
        ["default"] = function()
            vim.cmd([[ colorscheme nord ]])
			vim.opt.background = "dark"
        end
    }
}

local settings = require("settings")
colorschemes[settings.colorscheme][settings.variant]()
