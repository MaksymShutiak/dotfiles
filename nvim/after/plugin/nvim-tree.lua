local status, nvim_tree = pcall(require, 'nvim-tree')

if not status then
  print('Nvim tree is not loaded or installed . Please check configuration file')
end

local global = vim.g
global.loaded = 1
global.loaded_netrwPlugin = 1


nvim_tree.setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = { 
    custom = { '^.git$' }
  }
})
