return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require('which-key').setup()
		local wk = require('which-key')

		wk.add({
			{ '<leader>d', group = '[D]ebugger' },
			{ '<leader>d_', hidden = true },
			{ '<leader>f', group = '[F]ind' },
			{ '<leader>f_', hidden = true },
			{ '<leader>g', group = '[G]it' },
			{ '<leader>g_', hidden = true },
			{ '<leader>l', group = '[L]anguage' },
			{ '<leader>l_', hidden = true },
			{ '<leader>t', group = '[T]erminal' },
			{ '<leader>t_', hidden = true },
			{ '<leader>u', group = '[U]i' },
			{ '<leader>u_', hidden = true },
			{ '<leader>b', group = '[B]uffers' },
			{ '<leader>b_', hidden = true },
			{ '<leader>p', group = '[P]omodoro' },
			{ '<leader>p_', hidden = true },
		})
	end,
}
