local status, dashboard = pcall(require, 'dashboard')
local builtin = require'telescope.builtin'
if (not status) then return
  print('dashboard is not loaded or installed . Please check configuration file')
end

dashboard.setup {
  theme = 'doom',
  config = {
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'b',
        keymap = 'Space ff',
        key_hl = 'Number',
        action = builtin.find_files
      },
    },
  }
}
