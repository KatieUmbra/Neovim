local toggled = false

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if not toggled then
			vim.cmd([[ShowkeysToggle]])
			toggled = true
		end
	end,
})
