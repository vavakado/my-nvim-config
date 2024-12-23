return {
	{
		'nvim-telescope/telescope.nvim',
		version = '0.1.x',
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
			vim.keymap.set('n', '<Leader>fp', require('telescope').extensions.projects.projects, { desc = '[F]ind [P]rojects' })
			vim.keymap.set('n', '<Leader>fw', builtin.live_grep, { desc = '[F]ind [W]ord' })
			vim.keymap.set('n', '<Leader>fa', '<cmd>cd ~/.config/nvim/<CR><cmd>Telescope find_files<CR>', { desc = '[F]ind config' })
			vim.keymap.set('n', '<Leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
			vim.keymap.set('n', '<Leader>uc', builtin.colorscheme, { desc = '[F]ind [C]olorschemes' })
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
			vim.keymap.set('n', '<Leader>fd', ':Telescope zoxide list<CR>', { desc = '[F]ind [D]irectories' })
		end,
	},
}
