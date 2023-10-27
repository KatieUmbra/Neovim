local cmd = vim.api.nvim_create_autocmd

cmd("FileType", {
	pattern = "startup",
	command = [[set cursorline]],
})
