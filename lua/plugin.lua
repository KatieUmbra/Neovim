require("plugins")
return require("packer").startup(function(use)
	-- [[ Packer package manager ]]
	use "wbthomason/packer.nvim"
	-- [[[ Configuration Languages ]]]
	use "elkowar/yuck.vim"
	use "kovetskiy/sxhkd-vim"
	use "fladson/vim-kitty"
	-- [[ Neovim Api Helper ]]
	use "folke/neodev.nvim"
	-- [[ Syntax highligthing ]]
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end
	}
	-- [[ Icons ]]
	use "nvim-tree/nvim-web-devicons"
	-- [[ File Tree ]]
	use {"nvim-neo-tree/neo-tree.nvim", branch = "v2.x"}
	use "MunifTanjim/nui.nvim"
	-- [[ Color Theme ]]
	use "rose-pine/neovim"
	-- [[ Git Status ]]
	use "lewis6991/gitsigns.nvim"
	-- [[ Top Bar ]]
	use "romgrk/barbar.nvim"
	-- [[ Status Line ]]
	use "nvim-lualine/lualine.nvim"
	-- [[ Useful Functions ]]
	use "nvim-lua/plenary.nvim"
	use "nvim-lua/popup.nvim"
	-- [[ Search ]]
	use "nvim-telescope/telescope.nvim"
	-- [[ Linting and others. Etc.. ]]
	use { "williamboman/mason.nvim", run = ":MasonUpdate<CR>"}
	-- [[ LSP configurations ]]
	use "neovim/nvim-lspconfig"
	-- [[ Illuminate similar words]]
	use "RRethy/vim-illuminate"
	-- [[ Auto close pairs ]]
	use "windwp/nvim-autopairs"
	-- [[ Debugging ]]
	use "mfussenegger/nvim-dap"
	use "rcarriga/nvim-dap-ui"
	use "theHamsta/nvim-dap-virtual-text"
	-- [[ Completion ]]
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-nvim-lsp"
	use "williamboman/mason-lspconfig.nvim"
	-- [[ Completion Snippets ]]
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"
	use "rafamadriz/friendly-snippets"
	-- [[ Starting Screen ]]
	use "startup-nvim/startup.nvim"
	-- [[ Discord Integration ]]
	use "andweeb/presence.nvim"
	-- [[ Color Picker And Highligthing ]]
	use "uga-rosa/ccc.nvim"
	-- [[ Startup Ascii Art ]]
	use "MaximilianLloyd/ascii.nvim"
	-- [[ Lsp Actions (Rename, Definition, Etc...) ]]
	use "RishabhRD/lspactions"
	-- [[ Terminal ]]
	use "akinsho/toggleterm.nvim"
	-- [[ Run Tasks ]]
	use "jedrzejboczar/toggletasks.nvim"
	-- [[ Keybinding Suggestions ]]
	use "folke/which-key.nvim"
	-- [[ Notifications ]]
	use "rcarriga/nvim-notify"
	-- [[ Diagnostics Helper ]]
	use "folke/trouble.nvim"
	-- [[ Zen mode ]]
	use "Pocco81/true-zen.nvim"
	-- [[ Prettier Folds ]]
	use "anuvyklack/pretty-fold.nvim"
	-- [[ Prettier UI ]]
	use "stevearc/dressing.nvim"

	-- [[ Lsp Configuration Plugins ]]

	-- [[ C/C++ Lsp Configuration ]]
	use "p00f/clangd_extensions.nvim"
	-- [[ Rust Lsp Configuration ]]
	use "simrat39/rust-tools.nvim"
end)
