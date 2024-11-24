return {
	'Exafunction/codeium.vim',
	event = 'BufEnter',
	enabled = false,
	config = function()
		-- vim.g.codeium_manual = true
		-- vim.keymap.set('i', '<C-;>', function()
		-- 	vim.fn['codeium#CycleOrComplete']()
		-- end, { desc = 'Codeium cycle or complete' })
	end,
}
