local function config(module)
	return require("plugin.config."..module)
end

config("general")
config("lsp")
config("dap")
config("completion")
config("dressing")
config("treesitter")
config("pairs")
config("illuminate")
config("lualine")
