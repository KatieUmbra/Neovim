require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"vim",
		"rust",
		"python",
		"cmake",
		"css",
		"dockerfile",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"http",
		"luadoc",
		"markdown",
		"markdown_inline",
		"regex",
		"rust",
		"scss",
		"yaml",
		"json",
		"yuck",
		"toml",
		"sxhkdrc",
		"typescript",
		"javascript",
		"svelte",
		"zig"
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	},
	indent = {
		enable = true
	},
	autotag = {
		enable = true
	},
	sync_install = true
}
