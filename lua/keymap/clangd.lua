local defaults = { noremap = true, silent = true, nowait = true }
local function key(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

key("<leader>js", ":ClangdSwitchSourceHeader<CR>")
key("<leader>ja", ":ClangdAST<CR>")
key("<leader>jh", ":ClangdSymbolInfo<CR>")
key("<leader>jH", ":ClangdTypeHierarchy<CR>")
