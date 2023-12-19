local status, lualine = pcall(require, 'lualine')

if not status then
  print('Lualine is not loaded or installed . Please check configuration file')
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
  },
}
