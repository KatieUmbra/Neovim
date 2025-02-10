local options = vim.opt
local global = vim.g

global.mapleader = ","
global.maplocalleader = ","

-- [[ Context ]]
options.colorcolumn = ""
options.number = true
options.relativenumber = true
options.scrolloff = 4
options.signcolumn = "yes"

-- [[ Filetypes ]]
options.encoding = "utf8"

-- [[ Theme ]]
options.syntax = "ON"
options.termguicolors = true

-- [[ Search ]]
options.ignorecase = true
options.smartcase = true
options.incsearch = true
options.hlsearch = false

-- [[ Splits ]]
options.splitright = false
options.splitbelow = false

-- [[ Mouse ]]
options.mouse = ""

-- [[ Whitespace ]]
options.expandtab = true
options.shiftwidth = 4
options.softtabstop = 4
options.tabstop = 4
vim.opt.shiftwidth = 4
