local status, autopairs = pcall(require, 'nvim-autopairs')

if not status then
  print("Lualine is not loaded or installed . Please check configuration file")
end

autopairs.setup {}
