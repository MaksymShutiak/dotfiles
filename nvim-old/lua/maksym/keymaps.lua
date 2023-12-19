local keymap = vim.keymap
local global = vim.g
local builtin = require'telescope.builtin'
local bufopts = { noremap=true, silent=true }

global.mapleader = " "

keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fr', builtin.quickfix, {})
keymap.set('n', '<Leader>tt', '<cmd>NvimTreeToggle<CR>', bufopts)
keymap.set('n', '<Leader>tf', '<cmd>NvimTreeFindFile<CR>', bufopts)
keymap.set('n', '<Leader>ef', '<cmd>ALEFix eslint<CR>', bufopts)
keymap.set('n', '<Leader><CR>', '<cmd>so ~/.config/nvim/init.lua<CR>', bufopts)
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", bufopts)
keymap.set('i', '<C-h>', '<left>', bufopts)
keymap.set('i', '<C-j>', '<down>', bufopts)
keymap.set('i', '<C-k>', '<up>', bufopts)
keymap.set('i', '<C-l>', '<right>', bufopts)
