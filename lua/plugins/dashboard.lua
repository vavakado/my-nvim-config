return {
	{
		'goolord/alpha-nvim',
		dependencies = {
			'RileyGabrielson/inspire.nvim',
		},
		config = function()
			local alpha = require('alpha')
			local dashboard = require('alpha.themes.dashboard')
			local inspire = require('inspire')

			-- TODO: add more header options
			local header = {
				'           ⣀⣠⠶⠶⠖⣻⣟⠲⠶⠶⣤⣀      ',
				'        ⢀⣴⠛⠁   ⢀⡿⢻⡄   ⠈⠛⣦⡀   ',
				'       ⣴⠛      ⣾⠁ ⣿      ⠛⣦  ',
				'      ⣸⠁      ⢰⠏  ⠸⡇      ⠈⣧⡀',
				'     ⢸⡿⣿⣛⠛⠛⠛⠛⢛⡿⠛⠛⠛⠛⢿⡛⠛⠛⠛⠛⣛⣿⢿⡇',
				'     ⣼⠁ ⠙⠻⣤⡀ ⣸⠇    ⠘⣧ ⢀⣤⠞⠋  ⣿',
				'     ⢻⡀    ⠙⢷⣏⡀     ⣸⡿⠛     ⣿',
				'     ⢸⡇    ⢀⡾⠉⠙⢶⣀⣀⡶⠏⠁⢻⡄    ⢸⡇',
				'      ⢻⡀   ⣸⠇ ⢀⣴⠟⠻⢦⡀ ⠘⣧   ⢀⡞⠁',
				'       ⠻⣤ ⢠⣇⣤⠞⠋    ⠙⠳⣦⣸⡄ ⣤⠟  ',
				'        ⠈⠻⣿⡋⠁         ⢙⣿⠟⠁   ',
				'           ⠉⠻⠶⠶⣤⣤⣤⣤⠶⠶⠞⠉      ',
			}
			local quote = inspire.get_quote()
			local centered_quote = inspire.center_text(quote.text, quote.author, 34, 10, 34)

			for _, line_text in pairs(centered_quote) do
				table.insert(header, line_text)
			end

			dashboard.section.header.val = header
			dashboard.section.buttons.val = {
				dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
				dashboard.button('f', '󰈞  > Find file', ':cd $HOME/Development/projects/personal/ | Telescope find_files<CR>'),
				dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
				dashboard.button('n', '󰎚  > Notes', ':cd ~/Documents/notes/ | Telescope find_files<CR>'),
				dashboard.button('q', '󰅙  > Quit NVIM', ':qa<CR>'),
			}

			alpha.setup(dashboard.opts)
		end,
	},
	{
		'RileyGabrielson/inspire.nvim',
		config = function()
			require('inspire').setup({})
		end,
	},
}
