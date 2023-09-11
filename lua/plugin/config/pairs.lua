require("nvim-autopairs").setup {
	check_ts = true
}

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require("nvim-autopairs.conds")

npairs.add_rule(
	Rule(
		"<",
		">",
		{"cpp", "c", "rs", "py"}
	)
	:with_pair(cond.not_before_regex(">"))
)
