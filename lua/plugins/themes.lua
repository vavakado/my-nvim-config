return {
	{
		'nyoom-engineering/oxocarbon.nvim',
		lazy = false,
		priority = 1000,
		enabled = true,
		config = function()
			vim.cmd.colorscheme('oxocarbon')
		end,
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme('catppuccin')
		end,
	},
	{
		'neanias/everforest-nvim',
		version = false,
		lazy = false,
		enabled = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			vim.o.background = 'light'
			require('everforest').setup({
				italics = true,
			})
			require('everforest').load()
		end,
	},
	{
		'folke/tokyonight.nvim',
		name = 'tokyonight',
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require('tokyonight').setup({
				style = 'night',
				--transparent = true,
				--			on_colors = function(colors)
				--				colors.hint = colors.orange
				--				colors.error = '#ff0000'
				--			end,
			})
			vim.cmd.colorscheme('tokyonight')
			vim.o.background = 'dark'
		end,
	},
	{
		'rebelot/kanagawa.nvim',
	},

	{
		'olivercederborg/poimandres.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
		-- init = function()
		-- 	vim.cmd('colorscheme poimandres')
		-- end,
	},
}
