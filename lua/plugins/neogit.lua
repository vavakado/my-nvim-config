return {
	'NeogitOrg/neogit',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sindrets/diffview.nvim',
		'nvim-telescope/telescope.nvim',
	},
	config = function()
		local neogit = require('neogit')
		neogit.setup({
			graph_style = 'unicode',
		})
		vim.keymap.set('n', '<Leader>og', neogit.open, { desc = 'Open Git' })
		vim.keymap.set('n', '<Leader>gc', neogit.action('commit', 'commit', { '--all' }), { desc = 'Git Commit' })
		vim.keymap.set('n', '<Leader>gp', neogit.action('pull', 'from_pushremote', {}), { desc = 'Git pull' })
		vim.keymap.set('n', '<Leader>gP', neogit.action('push', 'to_upstream', {}), { desc = 'Git Push' })
		vim.keymap.set('n', '<Leader>gs', neogit.action('stash', 'both', {}), { desc = 'Git Stash' })
		vim.keymap.set('n', '<Leader>gm', neogit.action('merge', 'merge', {}), { desc = 'Git Merge' })
		vim.keymap.set('n', '<Leader>gr', neogit.action('rebase', 'interactively', {}), { desc = 'Git Rebase' })
	end,
}
