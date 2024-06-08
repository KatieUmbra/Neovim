local builtin = require("telescope.builtin")
local utils = require("telescope.utils")
local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

set("<leader>fg", builtin.live_grep)
set("<leader>fb", builtin.buffers)
set("<leader>fh", builtin.help_tags)

-- All files
set("<leader>fa", builtin.find_files)

-- Snippet source: https://www.reddit.com/r/neovim/comments/p1xj92/comment/h8gepxm/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
local function project_files()
	local _, ret, _ = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
	if ret == 0 then
		builtin.git_files()
	else
		builtin.find_files()
	end
end

set("<leader>ff", project_files)
