require("nightfox").setup {
	options = {
		terminal_colors = true,
		styles = {
			comments = "italic",
			types = "bold,italic",
			conditionals = "italic",
			functions = "italic"
		}
	},
	specs = {
		duskfox = {
			syntax = {
				type = "magenta.bright",
				keyword = "red",
				conditional = "pink.bright"
			}
		}
	}
}
