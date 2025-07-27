return {
	{
		'stevearc/oil.nvim',
		lazy = false,
		opts = {
			columns = {
				'icon',
			},
			win_options = {
				-- wrap = false,
				signcolumn = 'yes',
				-- cursorcolumn = false,
				-- foldcolumn = '0',
				-- spell = false,
				-- list = false,
				-- conceallevel = 3,
				-- concealcursor = 'nvic',
			},
			delete_to_trash = false,
			constrain_cursor = 'name',
		},
		keys = {
			{
				'<leader>o-',
				'<cmd>Oil .<CR>',
				desc = 'Filemanager',
			},
		},
		dependencies = { { 'echasnovski/mini.icons', opts = {} } },
	},
}
