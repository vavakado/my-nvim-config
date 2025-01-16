return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		local config = require('nvim-treesitter.configs')
		config.setup({
			auto_install = false,
			ensure_installed = 'all',
			ignore_install = { 'org', 'norg' },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
