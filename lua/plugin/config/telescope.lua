local telescope = require("telescope")

telescope.setup {
	defaults = {
		theme = "dropdown",
		file_ignore_patterns = { "node%_modules", "build", "*.o", "*.a" }
	}
}
