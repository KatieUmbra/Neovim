local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},
	},
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
})
