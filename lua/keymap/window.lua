local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

vim.opt.clipboard = "unnamedplus"

set("<leader>dd", function()
	vim.api.nvim_del_current_line()
end)
set("<leader>dl", "yyp")

vim.keymap.set("v", "<leader>ys", [["+y]])
set("<leader>ps", [["+p]])
