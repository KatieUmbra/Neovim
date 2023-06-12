require("plugins")
return require("packer").startup(function(use)
	-- [[ Packer package manager ]]
	use "wbthomason/packer.nvim"
	-- [[ Yuck language for eww bar ]]
	use "elkowar/yuck.vim"
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
	use "nvim-tree/nvim-tree.lua"
	-- [[ Color Theme ]]
	use "shaunsingh/nord.nvim"
	-- [[ Git Status ]]
	use "lewis6991/gitsigns.nvim"
	-- [[ Top Bar ]]
	use "romgrk/barbar.nvim"
	-- [[ Status Line ]]
	use "nvim-lualine/lualine.nvim"
	-- [[ Useful Functions ]]
	use "nvim-lua/plenary.nvim"
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
end)
