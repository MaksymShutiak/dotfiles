local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
  print("Treesitter is not loaded or installed . Please check configuration file")
end

treesitter.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
