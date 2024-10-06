return {
	'3rd/time-tracker.nvim',
	dependencies = {
		'3rd/sqlite.nvim',
	},
	enabled = false,
	event = 'VeryLazy',
	opts = {
		data_file = vim.fn.stdpath 'data' .. '/time-tracker.db',
	},
}
