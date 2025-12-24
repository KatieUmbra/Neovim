require("conform").setup({
	notify_on_error = false,
	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clangformat" },
		rust = { "rustfmt" },
		svelte = { "prettier" },
		odin = { "odinfmt" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		["*"] = { "trim_whitespace" },
	},
	formatters = {
		odinfmt = {
			command = "odinfmt",
			args = { "-stdin" },
			stdin = true,
		},
	},
})
