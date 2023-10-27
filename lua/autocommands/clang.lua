vim.api.nvim_create_autocmd("FileType", {
	pattern = { ".cpp", ".hpp", ".c", ".h" },
	command = [[ClangSetInlayHints]],
})

vim.api.nvim_create_autocmd("BufWritePost", {
	command = [[FormatWrite]],
})
