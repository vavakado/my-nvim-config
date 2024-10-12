return {
	{
		'neanias/everforest-nvim',
		version = false,
		lazy = false,
		enabled = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			vim.o.background = 'light'
			require('everforest').setup {
				italics = true,
			}
			require('everforest').load()
		end,
	},
}
