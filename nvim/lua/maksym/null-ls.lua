local null_ls = require("null-ls")

null_ls.setup({
    sources = {
      null_ls.builtins.diagnostics.cspell.with({
        extra_args = { "--config", vim.fn.expand("~/.config/nvim/cspell.json") },
      }),
    },
})
