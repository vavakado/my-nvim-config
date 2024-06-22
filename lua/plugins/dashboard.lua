return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		require('dashboard').setup {
			theme = 'hyper',
			shortcut_type = 'letter',
			config = {
				header = {
					'⣿⠟⣽⣿⣿⣿⣿⣿⢣⠟⠋⡜⠄⢸⣿⣿⡟⣬⢁⠠⠁⣤⠄⢰⠄⠇⢻⢸',
					'⢏⣾⣿⣿⣿⠿⣟⢁⡴⡀⡜⣠⣶⢸⣿⣿⢃⡇⠂⢁⣶⣦⣅⠈⠇⠄⢸⢸',
					'⣹⣿⣿⣿⡗⣾⡟⡜⣵⠃⣴⣿⣿⢸⣿⣿⢸⠘⢰⣿⣿⣿⣿⡀⢱⠄⠨⢸',
					'⣿⣿⣿⣿⡇⣿⢁⣾⣿⣾⣿⣿⣿⣿⣸⣿⡎⠐⠒⠚⠛⠛⠿⢧⠄⠄⢠⣼',
					'⣿⣿⣿⣿⠃⠿⢸⡿⠭⠭⢽⣿⣿⣿⢂⣿⠃⣤⠄⠄⠄⠄⠄⠄⠄⠄⣿⡾',
					'⣼⠏⣿⡏⠄⠄⢠⣤⣶⣶⣾⣿⣿⣟⣾⣾⣼⣿⠒⠄⠄⠄⡠⣴⡄⢠⣿⣵',
					'⣳⠄⣿⠄⠄⢣⠸⣹⣿⡟⣻⣿⣿⣿⣿⣿⣿⡿⡻⡖⠦⢤⣔⣯⡅⣼⡿⣹',
					'⡿⣼⢸⠄⠄⣷⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣕⡜⡌⡝⡸⠙⣼⠟⢱⠏',
					'⡇⣿⣧⡰⡄⣿⣿⣿⣿⡿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣋⣪⣥⢠⠏⠄',
					'⣧⢻⣿⣷⣧⢻⣿⣿⣿⡇⠄⢀⣀⣀⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠂⠄⠄',
					'⢹⣼⣿⣿⣿⣧⡻⣿⣿⣇⣴⣿⣿⣿⣷⢸⣿⣿⣿⣿⣿⣿⣿⣿⣰⠄⠄⠄',
					'⣼⡟⡟⣿⢸⣿⣿⣝⢿⣿⣾⣿⣿⣿⢟⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠄⡀⡀',
					'⣿⢰⣿⢹⢸⣿⣿⣿⣷⣝⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠉⠄⠄⣸⢰⡇',
					'⣿⣾⣹⣏⢸⣿⣿⣿⣿⣿⣷⣍⡻⣛⣛⣛⡉⠁⠄⠄⠄⠄⠄⠄⢀⢇⡏⠄',
					'',
					'Πώς ήταν η μέρα σου, ηλίθιε?',
				},
				shortcut = {
					{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
					{
						icon = ' ',
						icon_hl = '@variable',
						desc = 'Files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					--				{
					--					desc = " Apps",
					--					group = "DiagnosticHint",
					--					action = "Telescope app",
					--					key = "a",
					--				},
					--				{
					--					desc = " dotfiles",
					--					group = "Number",
					--					action = "Telescope dotfiles",
					--					key = "d",
					--				},
				},
				packages = { enable = true },
				project = {
					enable = true,
					limit = 8,
					icon = '',
					label = ' Your awesome projects:',
					action = 'Telescope find_files cwd=',
				},
				mru = { limit = 10, icon = '', label = ' Your recent files:', cwd_only = false },
				footer = {
					'wake up',
				}, -- footer
			},
		}
	end,
	dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
