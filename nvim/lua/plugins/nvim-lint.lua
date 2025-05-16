return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {}
    lint.linters.cspell = {
      cmd = "cspell",
      stdin = false,
      args = {
        "--no-color",
        "--no-progress",
        "--no-summary",
        "--config", vim.fn.expand("$HOME/.config/nvim/cspell.json")
      },
      stream = "stdout",
      ignore_exitcode = true,
      parser = require("lint.parser").from_errorformat("%f:%l:%c - %m", {
        source = "cspell",
        severity = vim.diagnostic.severity.WARN,
      }),
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if vim.bo.modifiable then
          lint.try_lint("cspell")
        end
      end,
    })
  end,
}
