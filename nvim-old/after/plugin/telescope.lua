local status, telescope = pcall(require, 'telescope')

if not status then
  print('Telescope is not loaded or installed. Please check configuration')
end

telescope.setup {}
