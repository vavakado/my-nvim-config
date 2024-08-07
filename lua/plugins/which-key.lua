return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require('which-key').setup()

		require('which-key').register {
			['<leader>l'] = { name = '[L]anguage', _ = 'which_key_ignore' },
			['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
			['<leader>t'] = { name = '[T]erminal', _ = 'which_key_ignore' },
			['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
			['<leader>u'] = { name = '[U]i', _ = 'which_key_ignore' },
		}
	end,
}
