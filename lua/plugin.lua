local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Leader Keys ]]
vim.g.mapleader = " "
vim.g.localleader = " "

require("lazy").setup({
	-- [[[ Configuration Languages ]]]
	"elkowar/yuck.vim",
	"kovetskiy/sxhkd-vim",
	"fladson/vim-kitty",
	-- [[ Neovim Api Helper ]]
	"folke/neodev.nvim",
	-- [[ Syntax highligthing ]]
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end
	},
	-- [[ Icons ]]
	"nvim-tree/nvim-web-devicons",
	-- [[ File Tree ]]
	{"nvim-neo-tree/neo-tree.nvim", branch = "v2.x"},
	"MunifTanjim/nui.nvim",
	-- [[ Color Theme ]]
	"navarasu/onedark.nvim",
	-- [[ Git Status ]]
	"lewis6991/gitsigns.nvim",
	-- [[ Top Bar ]]
	"romgrk/barbar.nvim",
	-- [[ Status Line ]]
	"nvim-lualine/lualine.nvim",
	-- [[ Useful Functions ]]
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	-- [[ Search ]]
	"nvim-telescope/telescope.nvim",
	-- [[ Linting and others. Etc.. ]]
	{ "williamboman/mason.nvim", build = ":MasonUpdate<CR>"},
	-- [[ LSP configurations ]]
	"neovim/nvim-lspconfig",
	-- [[ Illuminate similar words]]
	"RRethy/vim-illuminate",
	-- [[ Auto close pairs ]]
	"windwp/nvim-autopairs",
	-- [[ Auto Close Tags ]]
	"windwp/nvim-ts-autotag",
	-- [[ Debugging ]]
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	-- [[ Completion ]]
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"williamboman/mason-lspconfig.nvim",
	-- [[ Completion Snippets ]]
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	-- [[ Starting Screen ]]
	"startup-nvim/startup.nvim",
	-- [[ Discord Integration ]]
	"andweeb/presence.nvim",
	-- [[ Color Picker And Highligthing ]]
	"uga-rosa/ccc.nvim",
	-- [[ Startup Ascii Art ]]
	"MaximilianLloyd/ascii.nvim",
	-- [[ Lsp Actions (Rename, Definition, Etc...) ]]
	"RishabhRD/lspactions",
	-- [[ Terminal ]]
	"akinsho/toggleterm.nvim",
	-- [[ Run Tasks ]]
	"jedrzejboczar/toggletasks.nvim",
	-- [[ Keybinding Suggestions ]]
	"folke/which-key.nvim",
	-- [[ Notifications ]]
	"rcarriga/nvim-notify",
	-- [[ Diagnostics Helper ]]
	"folke/trouble.nvim",
	-- [[ Zen mode ]]
	"Pocco81/true-zen.nvim",
	-- [[ Prettier Folds ]]
	"anuvyklack/pretty-fold.nvim",
	-- [[ Prettier UI ]]
	"stevearc/dressing.nvim",
	-- [[ Rainbow Brackets ]]
	"HiPhish/rainbow-delimiters.nvim",
	-- [[ Indentation Lines ]]
	{ "lukas-reineke/indent-blankline.nvim", lazy = false },

	-- [[ Lsp Configuration Plugins ]]

	-- [[ C/C++ Lsp Configuration ]]
	"p00f/clangd_extensions.nvim",
	-- [[ CMake Lsp Configuration ]]
	"Civitasv/cmake-tools.nvim",
	-- [[ Rust Lsp Configuration ]]
	"simrat39/rust-tools.nvim",
	-- [[ Typescript Lsp Configuration ]]
	"pmizio/typescript-tools.nvim"
}, {})

require("plugins")
