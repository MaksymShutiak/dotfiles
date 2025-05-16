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

autocmd({
  "BufEnter",
  "BufRead",
}, {
	pattern = "*.overlay,*.keymap, *.conf",
	command = "set filetype=dts",
})

autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
