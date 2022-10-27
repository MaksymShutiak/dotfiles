local status, telescope = pcall(require, 'telescope')
if not status then
 print("Telescope is not loaded or installed. Please check ocnfiguration")
end

telescope.setup {
  pickers = {
    find_files = {
      hidden = true,
    }
  },
}
telescope.load_extension("file_browser")

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'fr', builtin.quickfix, {})
