return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		local config = require('nvim-treesitter.configs')
		config.setup({
			auto_install = false,
			ensure_installed = { 'lua', 'vim', 'c', 'vimdoc', 'go' },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
