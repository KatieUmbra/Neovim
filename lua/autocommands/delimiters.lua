vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	callback = function()
		local del = require("plugin.config.delimiters")
		del.run()
		del.SetColors(require("options.color").colors)
	end,
})
