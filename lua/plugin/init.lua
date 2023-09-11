require("lazy").setup {
	-- plugins
	{
		-- ============
		-- 	Essentials
		-- ============
		--[[ Plenary: Functions ]]	"nvim-lua/plenary.nvim",
		--[[ Telescope: Search ]]	"nvim-telescope/telescope.nvim",
		--[[ Lsp UI ]]				"stevearc/dressing.nvim",
		--[[ Tmux Integration ]]	"aserowy/tmux.nvim",
		--[[ Treesitter ]]			{ "nvim-treesitter/nvim-treesitter", build = function () vim.cmd(":TSUpdate") end },
		--[[ Auto Pairs ]]			"windwp/nvim-autopairs",
		--[[ Auto Tags ]]			"windwp/nvim-ts-autotag",
		--[[ Illuminate ]]			"RRethy/vim-illuminate",
		--[[ Status Line ]]			"nvim-lualine/lualine.nvim",
		--[[ Dev Icons ]]			"nvim-tree/nvim-web-devicons",
		-- ========
		-- 	Vanity
		-- ========
		--[[ Rose Pine: theme ]]	"rose-pine/neovim",
		--[[ Highlight Colors ]]	"brenoprata10/nvim-highlight-colors",
		--[[ Indent Guides ]]		{"lukas-reineke/indent-blankline.nvim", lazy = false},
		--[[ Delimiters ]]			"hiphish/rainbow-delimiters.nvim",
		--[[ Discord Integration ]] "andweeb/presence.nvim",
		--[[ Coding Time ]]			"wakatime/vim-wakatime",
		-- =============
		-- 	Completion
		-- =============
		--[[ Cmp Nvim Lsp ]]		"hrsh7th/cmp-nvim-lsp",
		--[[ Cmp Buffer ]]			"hrsh7th/cmp-buffer",
		--[[ Cmp Path ]]			"hrsh7th/cmp-path",
		--[[ Cmp Commandline ]]		"hrsh7th/cmp-cmdline",
		--[[ Cmp ]]					"hrsh7th/nvim-cmp",
		--[[ Lua Snip ]]			"L3MON4D3/LuaSnip",
		--[[ Cmp Lua Snip ]]		"saadparwaiz1/cmp_luasnip",
		--[[ Friendly Snippets ]]	"rafamadriz/friendly-snippets",
		-- ==================
		-- 	Language Servers
		-- ==================
		--[[ General ]]			"neovim/nvim-lspconfig",
		--[[ Neovim Lua API ]] 	"folke/neodev.nvim",
		--[[ Rust ]]			"simrat39/rust-tools.nvim",
		--[[ Rust Crates ]]		"Saecki/crates.nvim",
		--[[ Typescript ]]		"pmizio/typescript-tools.nvim",
		--[[ Json ]]			"b0o/SchemaStore.nvim",
		--[[ C++ / C ]]			"p00f/clangd_extensions.nvim",
		-- ==================
		-- 	Language Plugins
		-- ==================
		--[[ Eww ]]		"elkowar/yuck.vim",
		--[[ Bspwm ]]	"kovetskiy/sxhkd-vim",
		--[[ Kitty ]]	"fladson/vim-kitty",
		-- ============
		-- 	Debugging
		-- ============
		--[[ Adapter ]]			"mfussenegger/nvim-dap",
		--[[ Ui ]]				"rcarriga/nvim-dap-ui",
		--[[ Inline Hints ]]	"theHamsta/nvim-dap-virtual-text",
		--[[ REPL Cmp ]]		"rcarriga/cmp-dap",
		--[[ REPL Highlight ]]	"LiadOz/nvim-dap-repl-highlights",
		--[[ Python ]]			"mfussenegger/nvim-dap-python",
		-- =========
		--  Linting	
		-- =========
		--[[ Nvim Lint ]]	"mfussenegger/nvim-lint"
	},
	-- options
	{
	}
}

require("plugin.config")
