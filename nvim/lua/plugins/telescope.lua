return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "nvim-lua/plenary.nvim",
      },
    },
    config = function()
      local telescope = require("telescope")
      local map = vim.keymap.set

      map("n", "<leader>ff", require("telescope.builtin").find_files, {})
      map("n", "<leader>fg", require("telescope.builtin").live_grep, {})
      map("n", "<leader>fb", require("telescope.builtin").buffers, {})
      map("n", "<leader>fh", require("telescope.builtin").help_tags, {})
      map("n", "<leader>fr", require("telescope.builtin").quickfix, {})

      telescope.setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            vertical = { width = 0.9 },
          },
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").cycle_history_next,
              ["<C-k>"] = require("telescope.actions").cycle_history_prev,
            },
            n = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },

        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            hidden = true,
          },
          buffers = {
            hidden = true,
          },
          git_files = {
            hidden = true,
            show_untracked = true,
          },
        },
      })
      telescope.load_extension("fzf")
    end,
  }
}
