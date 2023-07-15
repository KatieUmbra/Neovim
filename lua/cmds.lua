local vim = vim
local cmd = vim.api.nvim_create_autocmd

-- [[ Attach Color ]]

cmd(
	{"BufRead", "BufNewFile"},
	{
		pattern = {"*.css", "*.scss", "*.md", "*.sass", "*.txt", ".tex"},
		command = [[ silent! CccHighlighterEnable ]]
	}
)
