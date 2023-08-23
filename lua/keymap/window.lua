local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

set("<C-y>", function() vim.api.nvim_del_current_line() end)
set("<C-d>", "yyp")
