return {
	'mcookly/bidi.nvim',
	config = function()
		require('bidi').setup({
			intuitive_delete = false,
		})
	end,
}
