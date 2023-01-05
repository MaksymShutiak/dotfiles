vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

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
  use 'nvim-treesitter/nvim-treesitter'
  -- Syntax highlight --

  -- Git --
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  -- Git --

  -- Theme --  
  -- use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'
  -- Theme -- 

  -- Editor --
  use 'windwp/nvim-autopairs'
  -- Editor --

  -- LSP Autocompletition --
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- LSP Autocompletition --

  -- Code completition -- 
  use 'mattn/emmet-vim'
  use 'tpope/vim-surround'
  use 'numToStr/Comment.nvim'
end)
