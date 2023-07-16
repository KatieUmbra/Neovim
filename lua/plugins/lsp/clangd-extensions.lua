require("clangd_extensions").setup {
	server = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy"
		}
	}
}
