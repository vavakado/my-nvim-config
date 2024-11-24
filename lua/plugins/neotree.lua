return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
	config = function()
		vim.keymap.set('n', '<Leader>ut', ':Neotree filesystem toggle reveal right<CR>', { desc = 'Toggle Neo[T]ree' })
		--		vim.keymap.set('n', '<Leader>ft', '<cmd>Neotree float filesystem toggle<CR>', { desc = 'Find Filetree' })
	end,
}
