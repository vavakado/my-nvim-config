return {
	'windwp/nvim-autopairs',
	event = 'InsertEnter',
	enabled = false,
	-- Optional dependency
	dependencies = { 'hrsh7th/nvim-cmp' },
	config = function()
		require('nvim-autopairs').setup({
			disable_filetype = { 'TelescopePrompt', 'spectre_panel', 'lisp' },
		})
		-- If you want to automatically add `(` after selecting a function or method
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		local cmp = require('cmp')
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	end,
}
