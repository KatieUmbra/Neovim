vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("CustomCppDetection", {}),
	desc = "Set .ixx (module) files to C++",
	callback = function(ev)
		if vim.fn.expand("%"):sub(4) == ".ixx" then
			vim.api.nvim_set_option_value("filetype", "cpp", { buf = ev.buf })
		end
	end,
})
