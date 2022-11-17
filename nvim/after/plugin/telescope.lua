local status, telescope = pcall(require, 'telescope')
if not status then
 print("Telescope is not loaded or installed. Please check ocnfiguration")
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = require('telescope.actions').cycle_history_next,
        ["<C-j>"] = require('telescope.actions').cycle_history_prev,
      },
    }
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  },
}

telescope.load_extension("file_browser")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.quickfix, {})
