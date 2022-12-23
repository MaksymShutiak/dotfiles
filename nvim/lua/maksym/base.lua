local opt = vim.opt
local global = vim.g
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd

-- gui
global.termguicolors = true
global.guifont = "DroidSansMono_Nerd_Font:h11"

opt.background = "dark"
opt.signcolumn = "yes"

-- line settings 
opt.number = true
opt.relativenumber = true
opt.wrap = false

-- tabs and indents 
opt.expandtab = true
opt.autoindent = true
opt.shiftwidth = 2
opt.tabstop = 2

-- search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- clipboard
opt.clipboard:append { 'unnamedplus' }


-- split windows
opt.splitright = true
opt.splitbelow = true

-- cursorline
opt.cursorline = true

opt.smartindent = true
opt.backup = false
opt.showcmd = true
opt.laststatus = 2
opt.scrolloff = 10
opt.inccommand = 'split'
opt.smarttab = true
opt.breakindent = true

opt.hidden = true
opt.undofile = true
opt.updatetime = 100
opt.swapfile = false
opt.iskeyword:append("_")

cmd("autocmd!")

autocmd("FileType", {
  pattern = 'css',
  command = "set filetype=scss"
})
