local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
	vim.keymap.set("v", lhs, rhs, defaults)
end

set("<Right>", ":echoe 'Use [l]'<CR>")
set("<Left>", ":echoe 'Use [h]'<CR>")
set("<Up>", ":echoe 'Use [k]'<CR>")
set("<Down>", ":echoe 'Use [j]'<CR>")
