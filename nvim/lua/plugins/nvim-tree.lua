return {
	"nvim-tree/nvim-tree.lua",

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
			custom = { "^.git$" },
		},
	},
}
