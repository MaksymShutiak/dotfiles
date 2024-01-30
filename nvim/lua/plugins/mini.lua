return {
  'echasnovski/mini.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  version = false,
  config = function ()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.bufremove').setup()
    require('mini.comment').setup({
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    })
  end

}
