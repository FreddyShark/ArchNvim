return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- lang server
	use 'neovim/nvim-lspconfig'

	-- autocomplete
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	-- needs snipet plugin
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { "nvim-telescope/telescope-file-browser.nvim" }

	-- editor
	use 'jiangmiao/auto-pairs'
	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'tpope/vim-commentary'
	use 'chaoren/vim-wordmotion'
	use 'wellle/targets.vim'
--	use 'hoob3rt/lualine.nvim'
--
	use 'Pocco81/auto-save.nvim'
	use 'airblade/vim-gitgutter'
--	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- asthetics
	use 'whatyouhide/vim-gotham'
	use 'Luxed/ayu-vim'
	use 'pR0Ps/molokai-dark'
end)
