return {
	'catppuccin/nvim',
	name = 'catppuccin',
	lazy = false,
	enabled = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme('catppuccin')
	end,
}
