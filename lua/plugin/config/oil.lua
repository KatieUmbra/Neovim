require("oil").setup({
	delete_to_trash = true,
	use_default_keymaps = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["gv"] = "actions.select_vsplit",
		["gh"] = "actions.select_split",
		["gP"] = "actions.preview",
		["gS"] = "actions.close",
		["gr"] = "actions.refresh",
		["gp"] = "actions.parent",
		["gC"] = "actions.open_cwd",
		["gc"] = "actions.cd",
		["g."] = "actions.toggle_hidden",
	},
	float = {
		padding = 10,
		max_width = 215,
		max_height = 120,
		border = "rounded",
	},
	win_options = {
		signcolumn = "no",
		cursorcolumn = true,
	},
	git = {
		add = function(path)
			return true
		end,
	},
})
