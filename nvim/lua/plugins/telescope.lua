return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ 
      "nvim-telescope/telescope-fzf-native.nvim", build = "make",
    },
	},
	config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
      defaults = {
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = nil,
        layout_strategy = nil,
        layout_config = nil,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        mappings = {
          i = {
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-p>"] = require("telescope.actions").move_selection_previous,
            ["<C-c>"] = require("telescope.actions").close,
            ["<C-j>"] = require("telescope.actions").cycle_history_next,
            ["<C-k>"] = require("telescope.actions").cycle_history_prev,
            ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
            ["<CR>"] = require("telescope.actions").select_default,
          },
          n = {
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-p>"] = require("telescope.actions").move_selection_previous,
            ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
          },
        },
        file_ignore_patterns = {},
        path_display = { "smart" },
        winblend = 0,
        border = {},
        borderchars = nil,
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        git_files = {
          hidden = true,
          show_untracked = true,
        },
      },

    })
    telescope.load_extension("fzf")
  local keymap = vim.keymap
  local builtin = require('telescope.builtin')
  keymap.set('n', '<leader>ff', builtin.find_files, {})
  keymap.set('n', '<leader>fg', builtin.live_grep, {})
  keymap.set('n', '<leader>fb', builtin.buffers, {})
  keymap.set('n', '<leader>fh', builtin.help_tags, {})
  keymap.set('n', '<leader>fr', builtin.quickfix, {})
	end,
}
