local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
	pattern = { "lua", "css", "javascript", "vue" },
	callback = function()
		vim.b.autoformat = false
	end,
})

autocmd("FileType", {
	pattern = "css",
	command = "set filetype=scss",
})
