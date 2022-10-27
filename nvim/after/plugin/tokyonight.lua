local status, tokyonight = pcall(require, 'tokyonight')

if not status then
 print("Tokyonight is not loaded or installed. Please check ocnfiguration")
end

tokyonight.setup({
  style = "moon",
  transparent = true,
})

vim.cmd[[colorscheme tokyonight-moon]]

