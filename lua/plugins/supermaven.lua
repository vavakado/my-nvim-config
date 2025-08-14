return {
	'supermaven-inc/supermaven-nvim',
	enabled = false,
	config = function()
		require('supermaven-nvim').setup({
			ignore_filetypes = { 'md', 'markdown', 'org', 'text' },
			keymaps = {
				accept_suggestion = '<C-G>',
				clear_suggestion = '<C-]>',
				accept_word = '<C-j>',
			},
		})
	end,
}
