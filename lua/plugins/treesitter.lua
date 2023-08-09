require("nvim-treesitter.configs").setup {

	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"vim",
		"rust",
		"python",
		"c_sharp",
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
		"luau",
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

	sync_install = true,
	indent = {enable = true},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	},

	autotag = {
		enable = true
	}
}
