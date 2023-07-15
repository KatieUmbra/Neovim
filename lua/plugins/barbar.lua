vim.g.barbar_auto_setup = false

require("barbar").setup {
	animation = false,
	tabpages = true,
	focus_on_close = "right",
	icons = {
		file_type = {
			custom_colors = false,
			enabled = true
		},
		preset = "powerline"
	},
	sidebar_filetypes = {
		["neo-tree"] = { event = "BufWipeout", text = "       󰔱 NeoTree" }
	}
}
