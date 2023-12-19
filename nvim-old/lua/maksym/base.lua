local options = vim.opt
local global = vim.g
local autocmd = vim.api.nvim_create_autocmd
local command = vim.cmd

-- gui
global.termguicolors = true
global.guifont = 'DroidSansMono_Nerd_Font:h11'

options.background = 'dark'
options.signcolumn = 'yes'

options.completeopt:append { 'menu', 'menuone', 'noselect'  }
-- line settings 
options.number = true
options.relativenumber = true
options.wrap = false

-- tabs and indents 
options.expandtab = true
options.autoindent = true
options.shiftwidth = 2
options.tabstop = 2

-- search
options.hlsearch = true
options.ignorecase = true
options.smartcase = true

-- clipboard
options.clipboard:append { 'unnamedplus' }


-- split windows
options.splitright = true
options.splitbelow = true

-- cursorline
options.cursorline = true

options.smartindent = true
options.backup = false
options.showcmd = true
options.laststatus = 2
options.scrolloff = 10
options.inccommand = 'split'
options.smarttab = true
options.breakindent = true

options.hidden = true
options.undofile = true
options.updatetime = 100
options.swapfile = false
options.iskeyword:append('_')
options.completeopt = {'menu', 'menuone', 'noselect'}
options.iskeyword:append({'-', '_'})

command('autocmd!')
autocmd('FileType', {
  pattern = 'css',
  command = 'set filetype=scss'
})
