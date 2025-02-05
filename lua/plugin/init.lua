require("lazy").setup({
	-- plugins
	{
		-- ============
		-- 	Essentials
		-- ============
		--[[ Plenary: Functions ]]
		"nvim-lua/plenary.nvim",
		--[[ Telescope: Search ]]
		"nvim-telescope/telescope.nvim",
		--[[ Lsp UI ]]
		"stevearc/dressing.nvim",
		--[[ Nui ]]
		"MunifTanjim/nui.nvim",
		--[[ Tmux Integration ]]
		"aserowy/tmux.nvim",
		--[[ Treesitter ]]
		{
			"nvim-treesitter/nvim-treesitter",
			--[[]]
			build = function()
				vim.cmd(":TSUpdate")
			end,
		},
		--[[ Auto Pairs ]]
		"windwp/nvim-autopairs",
		--[[ Auto Tags ]]
		"windwp/nvim-ts-autotag",
		--[[ Surround ]]
		{ "echasnovski/mini.surround", version = false },
		--[[ Illuminate ]]
		"RRethy/vim-illuminate",
		--[[ Status Line ]]
		"nvim-lualine/lualine.nvim",
		--[[ Dev Icons ]]
		"nvim-tree/nvim-web-devicons",
		--[[ Formatting ]]
		"mhartington/formatter.nvim",
		-- ========
		-- 	Vanity
		-- ========
		-- [[ COLORSCHEMES ]]

		--[[ Rose Pine: theme ]]
		"rose-pine/neovim",
		--[[ Nightfox: theme ]]
		"EdenEast/nightfox.nvim",
		--[[ One Dark: theme ]]
		"navarasu/onedark.nvim",

		-- [[ OTHER ]]
		-- [[ Showkeys ]]
		{ "nvchad/showkeys", cmd = "ShowkeysToggle" },
		--[[ Highlight Colors ]]
		"brenoprata10/nvim-highlight-colors",
		--[[ Indent Guides ]]
		{ "lukas-reineke/indent-blankline.nvim", lazy = false },
		--[[ Delimiters ]]
		"hiphish/rainbow-delimiters.nvim",
		--[[ Discord Integration ]]
		"andweeb/presence.nvim",
		--[[ Coding Time ]]
		"wakatime/vim-wakatime",
		--[[ Command Line ]]
		"folke/noice.nvim",
		--[[ Startup Screen ]]
		"startup-nvim/startup.nvim",
		--[[ Buffer File Browser ]]
		"stevearc/oil.nvim",
		--[[ Screenshots ]]
		{ "mistricky/codesnap.nvim", build = "make" },
		-- =============
		-- 	Completion
		-- =============
		--[[ Cmp Nvim Lsp ]]
		"hrsh7th/cmp-nvim-lsp",
		--[[ Cmp Buffer ]]
		"hrsh7th/cmp-buffer",
		--[[ Cmp Path ]]
		"hrsh7th/cmp-path",
		--[[ Cmp Commandline ]]
		"hrsh7th/cmp-cmdline",
		--[[ Cmp ]]
		"hrsh7th/nvim-cmp",
		--[[ Snippet Engine ]]
		"SirVer/ultisnips",
		--[[ Snippet Cmp Integration ]]
		"quangnguyen30192/cmp-nvim-ultisnips",
		-- ==================
		-- 	Language Servers
		-- ==================
		--[[ General ]]
		"neovim/nvim-lspconfig",
		--[[ Neovim Lua API ]]
		"folke/neodev.nvim",
		--[[ Rust ]]
		"simrat39/rust-tools.nvim",
		--[[ Rust Crates ]]
		"Saecki/crates.nvim",
		--[[ Typescript ]]
		"pmizio/typescript-tools.nvim",
		--[[ Json ]]
		"b0o/SchemaStore.nvim",
		--[[ C++ / C ]]
		"p00f/clangd_extensions.nvim",
		-- ==================
		-- 	Language Plugins
		-- ==================
		--[[ Eww ]]
		"elkowar/yuck.vim",
		--[[ Bspwm ]]
		"kovetskiy/sxhkd-vim",
		--[[ Kitty ]]
		"fladson/vim-kitty",
		--[[ Rhai ]]
		"rhaiscript/vim-rhai",
		-- ============
		-- 	Debugging
		-- ============
		--[[ Adapter ]]
		"mfussenegger/nvim-dap",
		-- [[ Dap Dependency ]]
		"nvim-neotest/nvim-nio",
		--[[ Ui ]]
		"rcarriga/nvim-dap-ui",
		--[[ Inline Hints ]]
		"theHamsta/nvim-dap-virtual-text",
		--[[ REPL Cmp ]]
		"rcarriga/cmp-dap",
		--[[ REPL Highlight ]]
		"LiadOz/nvim-dap-repl-highlights",
		--[[ Python ]]
		"mfussenegger/nvim-dap-python",
		--[[ CMake Tools ]]
		"Civitasv/cmake-tools.nvim",
		-- =========
		--  Linting
		-- =========
		--[[ Nvim Lint ]]
		"mfussenegger/nvim-lint",
	},
	-- options
	{},
})

require("plugin.config")
