local options = vim.opt
local global = vim.g

global.termguicolors = true
options.wrap = false
options.autoread = true
options.formatoptions = "jcrqlnt" -- tcqj
options.autoindent = true
options.hlsearch = true
options.backup = false
options.showcmd = true
options.smarttab = true
options.breakindent = true
options.hidden = true
options.iskeyword:append({ "-", "_" })
