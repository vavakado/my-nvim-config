local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', '<leader>la', function()
	vim.cmd.RustLsp 'codeAction'
end, { silent = true, buffer = bufnr, desc = 'Actions' })
vim.keymap.set('n', '<leader>lr', function()
	vim.cmd.RustLsp 'runnables'
end, { silent = true, buffer = bufnr, desc = 'Run' })
vim.keymap.set('n', '<leader>lx', function()
	vim.cmd.RustLsp 'renderDiagnostic'
end, { silent = true, buffer = bufnr, desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>lc', function()
	vim.cmd.RustLsp 'flyCheck'
end, { silent = true, buffer = bufnr, desc = 'Check' })