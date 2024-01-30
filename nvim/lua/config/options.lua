local options = vim.opt
local global = vim.g

global.termguicolors = true
options.signcolumn = "yes"
-- gui

-- line settings
options.number = true
options.relativenumber = true
options.wrap = false
options.autoread = true

-- tabs and indents
options.expandtab = true
options.autoindent = true
options.shiftwidth = 2
options.tabstop = 2

-- search
options.hlsearch = true
options.ignorecase = true
options.smartcase = true

options.grepformat = "%f:%l:%c:%m"
options.grepprg = "rg --vimgrep"

-- clipboard
options.clipboard:append({ "unnamedplus" })

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
options.inccommand = "split"
options.smarttab = true
options.breakindent = true

options.hidden = true
options.undofile = true
options.updatetime = 100
options.swapfile = false
options.completeopt = { "menu", "menuone", "noselect" }
options.iskeyword:append({ "-", "_" })
