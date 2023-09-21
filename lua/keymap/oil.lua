local defaults = {noremap = true, silent = true, nowait = true}
local function key(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

key("<leader>oo", ":Oil<CR>")
key("<leader>of", function() require("oil").open_float(nil) end)
