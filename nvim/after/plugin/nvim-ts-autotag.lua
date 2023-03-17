local status, autotag = pcall(require, 'nvim-ts-autotag')

if not status then
  print('Autotag is not loaded or installed . Please check configuration file')
end

autotag.setup {}
