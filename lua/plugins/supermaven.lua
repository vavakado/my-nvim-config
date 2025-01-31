return {
	'supermaven-inc/supermaven-nvim',
	config = function()
		require('supermaven-nvim').setup({
			keymaps = {
				accept_suggestion = '<C-G>',
				clear_suggestion = '<C-]>',
				accept_word = '<C-j>',
			},
			ignore_filetypes = {
				'org',
				'markdown',
				'text',
			},
		})
	end,
}
