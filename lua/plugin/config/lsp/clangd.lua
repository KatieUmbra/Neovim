require("clangd_extensions").setup({
	inlay_hints = {
		inline = vim.fn.has("nvim-0.10") == 1,
		only_current_line = false,
		show_parameter_hints = true,
		parameter_hints_prefix = "<- ",
		other_hints_prefix = "-> ",
	},
	server = {
		cmd = {
			"clangd",
			"--background-index",
			"--enable-config",
		},
	},
	extensions = {
		ast = {
			role_icons = {
				type = "",
				declaration = "",
				expression = "",
				specifier = "",
				statement = "",
				["template argument"] = "",
			},

			kind_icons = {
				Compound = "",
				Recovery = "",
				TranslationUnit = "",
				PackExpansion = "",
				TemplateTypeParm = "",
				TemplateTemplateParm = "",
				TemplateParamObject = "",
			},
		},
		symbol_info = {
			border = "rounded",
		},
	},
})
