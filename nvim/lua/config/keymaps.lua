local map = vim.keymap.set
local global = vim.g
local bufferOptions = { noremap = true, silent = true }

global.mapleader = " "

map("n", "<Leader>tt", "<cmd>NvimTreeToggle<CR>", bufferOptions)
map("n", "<Leader>tf", "<cmd>NvimTreeFindFile<CR>", bufferOptions)
map("n", "<Leader><CR>", "<cmd>so ~/.config/nvim/init.lua<CR>", bufferOptions)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", bufferOptions)
map("n", "<leader>bd", "<cmd>lua MiniBufremove.delete()<CR>", bufferOptions)
map("i", "<C-h>", "<left>", bufferOptions)
map("i", "<C-j>", "<down>", bufferOptions)
map("i", "<C-k>", "<up>", bufferOptions)
map("i", "<C-l>", "<right>", bufferOptions)

map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
