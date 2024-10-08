return {
	'folke/tokyonight.nvim',
	name = 'tokyonight',
	enabled = false,
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
	end,
}
