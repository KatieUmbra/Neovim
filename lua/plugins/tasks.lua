require("toggletasks").setup {
	silent = true,
	short_paths = true,
	scan = {
		global_cwd = true,
		lsp_root = true
	},
	toggleterm = {
		close_on_exit = false,
		hidden = true
	},
	telescope = {
		spawn = {
			open_single = true,
			show_running = false,
			mappings = {
				select_float = nil,
				spawn_smart = "<C-p>",
				spawn_all = "<C-a>"
			}
		},
		select = {
			mappings = {
				select_float = nil,
				open_smart = "<C-p>",
				open_all = "<C-a>",
				kill_all = "<A-a>",
				respawn_all = "<M-a>"
			}
		}
	}
}
