local options = vim.o
local window = vim.wo

local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

local hidden = false

set("<leader>zz", function()
	if hidden then
		require("lualine").hide({ place = { "statusline", "tabline", "winbar" }, unhide = true })
		options.list = true
		vim.opt.fillchars:append("eob:󰄛")
	else
		require("lualine").hide({ place = { "statusline", "tabline", "winbar" }, unhide = false })
		options.list = false
		vim.opt.fillchars:append("eob: ")
	end
	hidden = not hidden
	vim.cmd([[ ShowkeysToggle ]])
	vim.cmd([[ bufdo e ]])
end)

set("<leader>zc", function()
	if window.number then
		window.number = false
		window.relativenumber = false
	else
		window.number = true
		window.relativenumber = true
	end
end)
