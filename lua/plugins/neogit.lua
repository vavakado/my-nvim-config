return {
	'NeogitOrg/neogit',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sindrets/diffview.nvim',
		'nvim-telescope/telescope.nvim',
	},
	config = function()
		local neogit = require 'neogit'
		neogit.setup {
			graph_style = 'unicode',
		}
		vim.keymap.set('n', '<Leader>gg', neogit.open, { desc = '[G]it [G]it' })
		vim.keymap.set('n', '<Leader>gc', neogit.action('commit', 'commit', { '--all' }), { desc = '[G]it [C]ommit' })
		vim.keymap.set('n', '<Leader>gp', neogit.action('pull', 'from_pushremote', {}), { desc = '[G]it [p]ull' })
		vim.keymap.set('n', '<Leader>gP', neogit.action('push', 'to_upstream', {}), { desc = '[G]it [P]ush' })
		vim.keymap.set('n', '<Leader>gs', neogit.action('stash', 'both', {}), { desc = '[G]it [S]tash' })
		vim.keymap.set('n', '<Leader>gm', neogit.action('merge', 'merge', {}), { desc = '[G]it [M]erge' })
		vim.keymap.set('n', '<Leader>gr', neogit.action('rebase', 'interactively', {}), { desc = '[G]it [R]ebase' })
	end,
}
