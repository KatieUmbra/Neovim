local options = vim.opt
local global = vim.g

-- [[ Leader Key ]]
global.mapleader = " "
global.localleader = " "

-- [[ ColorScheme ]]
require("nord").set()
global.nord_disable_background = true
global.nord_borders = true

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

-- [[ Splits ]]
options.splitright = false
options.splitbelow = false

-- [[ Nvim Tree ]]
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1
global.nvim_tree_auto_close = 1

-- [[ Completions ]]
options.completeopt = {"menu", "menuone", "noselect"}
