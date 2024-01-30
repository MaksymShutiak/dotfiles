local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "css",
	command = "set filetype=scss",
})
