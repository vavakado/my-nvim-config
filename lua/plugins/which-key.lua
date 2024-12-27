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
			{ '<leader>d', group = 'Debugger' },
			{ '<leader>d_', hidden = true },
			{ '<leader>f', group = 'Find' },
			{ '<leader>f_', hidden = true },
			{ '<leader>g', group = 'Git' },
			{ '<leader>g_', hidden = true },
			{ '<leader>l', group = 'Language' },
			{ '<leader>l_', hidden = true },
			{ '<leader>t', group = 'Terminal' },
			{ '<leader>t_', hidden = true },
			{ '<leader>u', group = 'Ui' },
			{ '<leader>u_', hidden = true },
			{ '<leader>b', group = 'Buffers' },
			{ '<leader>b_', hidden = true },
			{ '<leader>p', group = 'Pomodoro' },
			{ '<leader>p_', hidden = true },
		})
	end,
}
