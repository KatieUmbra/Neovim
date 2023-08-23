require("clangd_extensions").setup {
	server = {
		cmd = {
			"clangd",
			"--background-index",
			"--enable-config"
		}
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
            }
		},
		symbol_info = {
			border = "rounded"
		}
	}
}
