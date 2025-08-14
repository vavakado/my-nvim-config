return {
    {
        'catgoose/nvim-colorizer.lua',
        event = 'BufReadPre',
        opts = { -- set to setup table
            user_default_options = {
                names = false,
                css = true,
                css_fn = true,
            },
        },
    },
    {
        'izocha/graphviz.nvim',
        ft = { 'dot' },
        config = true,
    },
    --[[ {
		'luckasRanarison/tailwind-tools.nvim',
		name = 'tailwind-tools',
		build = ':UpdateRemotePlugins',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-telescope/telescope.nvim', -- optional
			'neovim/nvim-lspconfig', -- optional
		},
		opts = {}, -- your configuration
	}, ]]
}
