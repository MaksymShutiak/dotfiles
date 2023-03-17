vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use "williamboman/mason.nvim"

  -- Dev icons --
  use 'kyazdani42/nvim-web-devicons'
  -- Dev icons --

  -- File Explorer 
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- File Explorer 

  -- File Tree -- 
  use 'nvim-tree/nvim-tree.lua'
  -- File Tree --

  use({'glepnir/lspsaga.nvim', branch = 'main' })

  -- Status line --
  use 'nvim-lualine/lualine.nvim'
  -- Status Line --

  -- Syntax highlight --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- Syntax highlight --

  -- Git --
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  -- Git --

  -- Theme --  
  use 'folke/tokyonight.nvim'
  -- Theme -- 

  -- Editor --
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  -- Editor --

  -- LSP Autocompletition --
  use 'neovim/nvim-lspconfig' -- LSP settings collection 
  use 'hrsh7th/nvim-cmp' -- LSP autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- LSP snipets source
  use 'saadparwaiz1/cmp_luasnip' -- Snippets engine
  use 'rafamadriz/friendly-snippets' -- Snipets 
  -- LSP Autocompletition --

  -- Code completition -- 
  use 'tpope/vim-surround'
  use 'numToStr/Comment.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- Code completition -- 
end)
