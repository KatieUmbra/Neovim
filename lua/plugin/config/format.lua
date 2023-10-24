local util = require("formatter.util")

require("formatter").setup {
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		cpp = {
			require("formatter.filetypes.cpp").clangformat
		}
	},
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace
	}
}
