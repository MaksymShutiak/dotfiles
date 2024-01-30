local cmd = vim.api.nvim_create_user_command

cmd("Grep", function(opts)
	-- local fname = vim.fn.input("File: ", "", "file")
	-- vim.cmd("grep '" .. opts.args .. "" .. "' src/**/*.{js,vue} --exclude=\\*.spec.js")
	vim.cmd("grep '" .. opts.args .. "" .. "' src/**/*.{js,vue} --iglob=\\*.spec.js")
end, { nargs = 1 })
