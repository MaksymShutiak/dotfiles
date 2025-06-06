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
    keymap = { preset = 'default' },

    default = { 'lsp', 'path', 'snippets', 'buffer' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    completion = { documentation = { auto_show = false } },

    signature = {
      enabled = true,
    },
  },
}
