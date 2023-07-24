local fold = require("pretty-fold")

fold.setup {
	keep_indentation = true,
	fill_char = "━",
	sections = {
		left = {
			'━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
		},
		right = {
			'┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
		}
	}
}

fold.ft_setup("cpp", {
	process_comment_signs = false,
	comment_signs = {
		"/**"
	},
	stop_words = {
		'%*%s*@brief%s*'
	}
})
