return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('todo-comments').setup()
		vim.keymap.set('n', '<leader>fc', '<cmd>TodoTelescope<CR>', { desc = '[F]ind [C]omments' })
	end,
}
