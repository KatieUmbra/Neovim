vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = ".ixx",
	callback = function()
		vim.cmd([[ set filetype=cpp ]])
	end,
})
