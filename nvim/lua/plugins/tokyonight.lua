return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    local tokyonight = require('tokyonight')

    tokyonight.setup({
      style = "moon",
      -- transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true,
    })

    vim.cmd[[colorscheme tokyonight-moon]]
  end
}
