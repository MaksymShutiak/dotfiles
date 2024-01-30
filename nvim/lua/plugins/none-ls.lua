return {
	"nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function ()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.cspell.with({
          extra_args = { "--config", vim.fn.expand("$HOME/.config/nvim/cspell.json") },
        }),
      },
    })
  end
}
