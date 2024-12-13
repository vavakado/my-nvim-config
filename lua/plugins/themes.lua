return {
	{
		'nyoom-engineering/oxocarbon.nvim',
		lazy = false,
		priority = 1000,
		-- enabled = true,
		-- config = function()
		-- vim.cmd.colorscheme('oxocarbon')
		-- end,
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		-- enabled = false,
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme('catppuccin')
		-- end,
	},
	{
		'neanias/everforest-nvim',
		version = false,
		lazy = false,
		-- enabled = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			-- vim.o.background = 'light'
			require('everforest').setup({
				italics = true,
			})
			-- require('everforest').load()
		end,
	},
	{
		'folke/tokyonight.nvim',
		name = 'tokyonight',
		-- enabled = false,
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
			-- vim.cmd.colorscheme('tokyonight')
			-- vim.o.background = 'dark'
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
	{
		'xero/evangelion.nvim',
		lazy = false,
		priority = 1000,
		-- opts = {
		-- 	overrides = {
		-- 		keyword = { fg = '#00ff00', bg = '#222222', undercurl = true },
		-- 		['@boolean'] = { link = 'Special' },
		-- 	},
		-- },
		init = function()
			vim.cmd.colorscheme('evangelion')
		end,
	},
	{
		'xero/miasma.nvim',
		branch = 'lua',
		lazy = false,
		config = function()
			-- vim.cmd.colorscheme('miasma')
		end,
	},
}
