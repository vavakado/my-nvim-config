return {
	{
		'nvim-telescope/telescope.nvim',
		version = '0.1.x',
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Find Files' })
			vim.keymap.set('n', '<Leader>fw', builtin.live_grep, { desc = 'Find Word' })
			vim.keymap.set('n', '<Leader>fa', '<cmd>cd ~/.config/nvim/<CR><cmd>Telescope find_files<CR>', { desc = 'Find config' })
			vim.keymap.set('n', '<Leader>fb', builtin.buffers, { desc = 'Find Buffers' })
			vim.keymap.set('n', '<Leader>uc', builtin.colorscheme, { desc = 'Find Colorschemes' })
		end,
		opts = {
			-- extensions = {
			-- 	file_browser = {
			-- 		theme = 'dropdown',
			-- 		-- other options
			-- 	},
			-- },
		},
	},
	{
		'dawsers/telescope-locate.nvim',
		config = function()
			require('telescope').load_extension('locate')
			-- no keybind cuz it doesn't support dynamic search
		end,
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		config = function()
			require('telescope').load_extension('file_browser')
			vim.keymap.set(
				'n',
				'<Leader>fo',
				"<cmd>lua require('telescope').extensions.file_browser.file_browser(require('telescope.themes').get_ivy({}))<cr>",
				{ desc = 'Find Files Dropdown' }
			)
		end,
	},
	-- {
	-- 	'nvim-telescope/telescope-fzf-native.nvim',
	-- 	build = 'make',
	-- 	config = function()
	-- 		-- To get fzf loaded and working with telescope, you need to call
	-- 		-- load_extension, somewhere after setup function:
	-- 		require('telescope').load_extension('fzf')
	-- 	end,
	-- },
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require('telescope').setup({
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown({}),
					},
				},
			})
			require('telescope').load_extension('ui-select')
		end,
	},
	{
		'jvgrootveld/telescope-zoxide',
		config = function()
			local z_utils = require('telescope._extensions.zoxide.utils')

			require('telescope').setup({
				extensions = {
					zoxide = {
						prompt_title = '[ Zoxide ]',
						mappings = {
							default = {
								after_action = function(selection)
									print('Update to (' .. selection.z_score .. ') ' .. selection.path)
								end,
							},
							-- Opens the selected entry in a new split
							['<C-q>'] = { action = z_utils.create_basic_command('split') },
						},
					},
				},
				-- require('telescope').load_extension "zoxide",
			})
			vim.keymap.set('n', '<Leader>fd', ':Telescope zoxide list<CR>', { desc = 'Find Directories' })
		end,
	},
}
