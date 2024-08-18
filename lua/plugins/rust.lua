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
		version = '^4', -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
