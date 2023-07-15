require("nightfox").setup {
	options = {
		terminal_colors = true,
		styles = {
			comments = "italic",
			keywords = "bold",
			types = "bold",
		}
	},
	specs = {
		all = {
			syntax = {
				types = "magenta.bright"
			}
		}
	}
}
