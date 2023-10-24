local M = {
	themes = {
		ivy = require("telescope.themes").get_ivy{
			previewer = false,
			winblend = 5,
			prompt_prefix = "Diagnostics:",
			prompt_title = "",
			borderchars = {
				{ '─', '│', '─', '│', '┌', '┐', '┘', '└'},
				prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
				results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
				preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
			},
		}
	}
}

return M
