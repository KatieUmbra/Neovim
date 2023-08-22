require("plugin")
require("keymap")
require("cmds")
require("opt")
-- Syntax file
-- Comment out
vim.cmd([[source /home/Katie/.config/nvim/syntax/moonlight.vim]])
vim.cmd([[au BufRead,BufNewFile *.moonlight setfiletype moonlight]])
vim.cmd([[au BufRead,BufNewFile *.🌙 setfiletype moonlight]])
