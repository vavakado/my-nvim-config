return {
	{
		'monkoose/nvlime',

		dependencies = { 'monkoose/parsley' },
		ft = { 'lisp' },
		init = function()
			vim.g.nvlime_config = {
				cmp = {
					enabled = true,
				},
			}
		end,
	},
	{
		'gpanders/nvim-parinfer',
		ft = { 'lisp' },
	},
}
