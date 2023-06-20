local vim = vim
local options = vim.opt
local global = vim.g

-- [[ Leader Key ]]
global.mapleader = " "
global.localleader = " "

-- [[ ColorScheme ]]
vim.cmd[[
	colorscheme nord
]]
global.nord_cursor_line_number_background = 1
global.nord_uniform_status_lines = 1
global.nord_bold_vertical_split_line = 1
global.nord_italic_comments = 1
global.nord_underline = 1

-- [[ Context ]]
options.colorcolumn = ""
options.number = true
options.relativenumber = false
options.scrolloff = 4
options.signcolumn = "yes"

-- [[ Filetypes ]]
options.encoding = "utf8"
options.fileencoding = "utf8"

-- [[ Theme ]]
options.syntax = "ON"
options.termguicolors = true

-- [[ Search ]]
options.ignorecase = true
options.smartcase = true
options.incsearch = true
options.hlsearch = false

-- [[ Whitespace ]]
options.expandtab = false
options.shiftwidth = 4
options.softtabstop = 4
options.tabstop = 4
options.fillchars:append { eob = "󰄛" }

-- [[ Splits ]]
options.splitright = false
options.splitbelow = false

-- [[ Completions ]]
options.completeopt = {"menu", "menuone", "noselect"}
