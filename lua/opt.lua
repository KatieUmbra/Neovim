local vim = vim
local options = vim.opt

-- [[ ColorScheme ]]
vim.o.background = "dark"

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
options.smartindent = true
options.fillchars:append { eob = "󰄛" }

-- [[ Splits ]]
options.splitright = false
options.splitbelow = false

-- [[ Completions ]]
options.completeopt = {"menu", "menuone", "noselect"}

-- [[ Notifications ]]
vim.notify = require("notify")

--[[ Folding ]]
options.foldmethod = "expr"
options.foldexpr = "nvim_treesitter#foldexpr()"
options.foldenable = false
