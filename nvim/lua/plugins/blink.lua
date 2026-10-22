return {
  'saghen/blink.cmp',
  dependencies = {
    { 'rafamadriz/friendly-snippets' },
    {
      'folke/lazydev.nvim',
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } }
        }
      }
    },
  },
  version = '1.*',
  opts = {
    keymap = { 
      preset = 'default',
      ['<C-e>'] = {'show', 'hide'}, -- or {}
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
}
