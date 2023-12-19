
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'wbthomason/packer.nvim',
  'nvim-lua/plenary.nvim',
  "williamboman/mason.nvim",

  -- Dev icons --
  'kyazdani42/nvim-web-devicons',
  -- Dev icons --

  -- File Explorer 
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  -- File Explorer 

  -- File Tree -- 
  {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
  -- File Tree --

  {'glepnir/lspsaga.nvim', branch = 'main' },

  -- Status line --
  'nvim-lualine/lualine.nvim',
  -- Status Line --

  -- Syntax highlight --
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  -- Syntax highlight --

  -- Git --
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'lewis6991/gitsigns.nvim',
  -- Git --

  -- Theme --  
  'folke/tokyonight.nvim',
  -- Theme -- 

  -- Editor --
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  -- Editor --

  -- LSP Autocompletition --
  'hrsh7th/nvim-cmp', -- LSP autocompletion plugin
  'neovim/nvim-lspconfig',
  'SirVer/ultisnips',
  'quangnguyen30192/cmp-nvim-ultisnips',
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  -- LSP Autocompletition --

  -- Code completition -- 
  'tpope/vim-surround',
  'numToStr/Comment.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'mattn/emmet-vim',
  -- Code completition -- 
})

require('maksym.base')
require('maksym.keymaps')
require('maksym.cmp')
require('maksym.comment')
require('maksym.gitsigns')
require('maksym.lsp')
require('maksym.lualine')
require('maksym.mason')
require('maksym.nvim-autopairs')
require('maksym.nvim-tree')
require('maksym.nvim-ts-autotag')
require('maksym.telescope')
require('maksym.tokyonight')
require('maksym.treesitter')
require('maksym.web-dev-icons')
--
