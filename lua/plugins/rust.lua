return {
	{
		'saecki/crates.nvim',
		tag = 'stable',
		event = { 'BufRead Cargo.toml' },
		config = function()
			require('crates').setup()
		end,
	},
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						-- rust-analyzer language server configuration
						['rust-analyzer'] = {
							checkOnSave = false,
						},
					},
				},
			}
		end,
	},
}
