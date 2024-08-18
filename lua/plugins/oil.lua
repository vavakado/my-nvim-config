return {
	{
		'stevearc/oil.nvim',
		opts = {
			vim.keymap.set('n', '<Leader>ft', '<cmd>e .<CR>', { desc = 'Filemanager' }),
		},
		dependencies = { { 'echasnovski/mini.icons', opts = {} } },
	},
}
