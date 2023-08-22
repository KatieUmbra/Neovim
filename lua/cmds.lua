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

-- [[ Fix Colors ]]
cmd(
	{"BufWinEnter"},
	{
		command = [[ :source ~/.config/nvim/lua/plugins/rainbow.lua ]]
	}
)

-- [[ Open folds when file is opened ]]
cmd(
	{"BufWinEnter"},
	{
		command = [[
			if getbufvar(bufnr(), '&buftype', 'ERROR') == ''
				silent! normal zR
			endif
		]]
	}
)
