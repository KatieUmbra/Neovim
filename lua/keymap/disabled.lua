
local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

set("<Right>", ":echoe 'Use [L]'<CR>")
set("<Left>", ":echoe 'Use [H]'<CR>")
set("<Up>", ":echoe 'Use [K]'<CR>")
set("<Down>", ":echoe 'Use [J]'<CR>")
