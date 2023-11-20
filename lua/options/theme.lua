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

require("rose-pine").setup({
	variant = "moon",
	dark_variant = "moon",
})

vim.cmd("colorscheme rose-pine")

vim.opt.background = "dark"
