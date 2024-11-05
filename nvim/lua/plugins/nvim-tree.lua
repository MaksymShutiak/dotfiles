return {
	"nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

	opts = {
		sort_by = "case_sensitive",
		view = {
			adaptive_size = true,
			width = 30,
		},
		renderer = {
			root_folder_modifier = ":t",
			group_empty = true,
		},
    filters = {
      dotfiles = false,
      git_clean = false,
      no_buffer = false,
      custom = { 'node_modules' },
    },
	},
}
