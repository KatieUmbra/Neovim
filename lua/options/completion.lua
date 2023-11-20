local option = vim.opt
local options = vim.opts
local global = vim.g

global.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.cmd([[ g:completion_enable_auto_popup = 1 ]])
