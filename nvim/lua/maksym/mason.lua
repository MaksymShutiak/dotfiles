local status, mason = pcall(require, 'mason')

if not status then
  print('Mason is not loaded or installed . Please check configuration file')
end

mason.setup()

