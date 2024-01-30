local keymap = vim.keymap
local global = vim.g
local bufopts = { noremap = true, silent = true }

global.mapleader = " "

keymap.set("n", "<Leader>tt", "<cmd>NvimTreeToggle<CR>", bufopts)
keymap.set("n", "<Leader>tf", "<cmd>NvimTreeFindFile<CR>", bufopts)
keymap.set("n", "<Leader><CR>", "<cmd>so ~/.config/nvim/init.lua<CR>", bufopts)
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", bufopts)
keymap.set("i", "<C-h>", "<left>", bufopts)
keymap.set("i", "<C-j>", "<down>", bufopts)
keymap.set("i", "<C-k>", "<up>", bufopts)
keymap.set("i", "<C-l>", "<right>", bufopts)
