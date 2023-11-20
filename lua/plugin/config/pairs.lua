-- https://www.reddit.com/r/neovim/comments/17opztf/c_devs_here_is_everything_you_need_for_setting_up/
local npairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
	check_ts = true,
})

local is_template = require("options.pairs").is_template
local semicolon = require("options.pairs").struct_class_semicolon

npairs.add_rules({
	rule("<", ">"):with_pair(cond.none()):with_move(cond.done()):use_key(">"),
	rule("{", "};", { "cpp", "c" }):with_pair(semicolon),
})

vim.keymap.set("i", "<", is_template)
