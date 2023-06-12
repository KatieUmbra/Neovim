require("telescope").setup {
	pickers = {
		find_files = {
			theme = "dropdown"
		}
	}
}

local builtin = require("telescope.builtin")
local set = vim.keymap.set
local sets = {noremap = true, silent = true}
set("n", "<leader>ff",	builtin.find_files,		sets)
set("n", "<leader>f",	builtin.live_grep,		sets)
set("n", "<leader>fb",	builtin.buffers,		sets)
set("n", "<leader>ft",	builtin.treesitter,		sets)
set("n", "<leader>fx",	builtin.diagnostics,	sets)
set("n", "<leader>fg",	builtin.git_status,		sets)
