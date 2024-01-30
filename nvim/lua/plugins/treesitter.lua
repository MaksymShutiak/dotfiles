return {
	"nvim-treesitter/nvim-treesitter",
	config = function ()
		require('nvim-treesitter.configs').setup({
			sync_install = false,
			ignore_install = { "phpdoc" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end
}
