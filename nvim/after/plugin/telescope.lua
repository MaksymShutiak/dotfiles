local status, telescope = pcall(require, 'telescope')

if not status then
  print('Telescope is not loaded or installed. Please check ocnfiguration')
end

local ok, actions = pcall(require, 'telescope.actions')
if not ok then
  return
end

telescope.setup {
  defaults = {
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = nil,
    layout_strategy = nil,
    layout_config = nil,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob=!.git/',
    },
    mappings = {
      i = {
        ['<C-n>'] = actions.move_selection_next,
        ['<C-p>'] = actions.move_selection_previous,
        ['<C-c>'] = actions.close,
        ['<C-j>'] = actions.cycle_history_next,
        ['<C-k>'] = actions.cycle_history_prev,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
        ['<CR>'] = actions.select_default,
      },
      n = {
        ['<C-n>'] = actions.move_selection_next,
        ['<C-p>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
    file_ignore_patterns = {},
    path_display = { 'smart' },
    winblend = 0,
    border = {},
    borderchars = nil,
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
      hidden = true,
    },
    git_files = {
      hidden = true,
      show_untracked = true,
    },
  },
}

telescope.load_extension('file_browser')
