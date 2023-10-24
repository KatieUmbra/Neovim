local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

set("<leader>df", "Format")
set("<leader>dF", "FormatWrite")
