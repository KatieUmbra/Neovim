vim.api.nvim_create_autocmd("FileType", {
	pattern = { ".cpp", ".hpp", ".c", ".h" },
	command = [[ClangSetInlayHints]],
})
