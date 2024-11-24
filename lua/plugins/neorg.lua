return {
	'nvim-neorg/neorg',
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	enabled = false,
	version = '*', -- Pin Neorg to the latest stable release
	config = {
		load = {
			['core.defaults'] = {},
			['core.concealer'] = {},
			['core.completion'] = {
				config = {
					engine = 'nvim-cmp',
				},
			},
			['core.dirman'] = {
				config = {
					open_last_workspace = false,
				},
			},
			['core.journal'] = {
				config = {
					strategy = 'flat',
					workspace = nil,
				},
			},
			['core.dirman'] = {
				config = {
					workspaces = {
						notes = '~/notes',
					},
				},
			},
		},
	},
}
