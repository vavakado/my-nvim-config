return {
	'folke/tokyonight.nvim',
	name = 'tokyonight',
	enabled = true,
	lazy = false,
	priority = 1000,
	config = function()
		require('tokyonight').setup {
			style = 'night',
			--transparent = true,
			--			on_colors = function(colors)
			--				colors.hint = colors.orange
			--				colors.error = '#ff0000'
			--			end,
		}
		vim.cmd.colorscheme 'tokyonight'
		vim.o.background = 'dark'
	end,
}
