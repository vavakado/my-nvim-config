return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require('toggleterm').setup({
			highlights = {
				Normal = { link = 'Normal' },
				NormalNC = { link = 'NormalNC' },
				NormalFloat = { link = 'NormalFloat' },
				FloatBorder = { link = 'FloatBorder' },
				StatusLine = { link = 'StatusLine' },
				StatusLineNC = { link = 'StatusLineNC' },
				WinBar = { link = 'WinBar' },
				WinBarNC = { link = 'WinBarNC' },
			},
			size = 10,
			---@param t Terminal
			on_create = function(t)
				vim.opt_local.foldcolumn = '0'
				vim.opt_local.signcolumn = 'no'
				if t.hidden then
					local toggle = function()
						t:toggle()
					end
					vim.keymap.set({ 'n', 't', 'i' }, "<C-'>", toggle, { desc = 'Toggle terminal', buffer = t.bufnr })
					vim.keymap.set({ 'n', 't', 'i' }, '<F7>', toggle, { desc = 'Toggle terminal', buffer = t.bufnr })
				end
			end,
			shading_factor = 2,
			direction = 'float',
			float_opts = { border = 'rounded' },
		})
		vim.keymap.set('n', '<Leader>tt', '<Cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle Terminal' })
		vim.keymap.set('n', '<Leader>tv', '<Cmd>ToggleTerm size=80 direction=vertical<CR>', { desc = 'Terminal Vertical' })
		vim.keymap.set('n', '<Leader>th', '<Cmd>ToggleTerm size=16 direction=horizontal<CR>', { desc = 'Terminal Horizontal' })
		vim.keymap.set('n', '<F7>', '<Cmd>execute v:count . "ToggleTerm"<CR>', { desc = 'Toggle Terminal' })
		vim.keymap.set('t', '<F7>', '<Cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
		vim.keymap.set('i', '<F7>', '<Esc><Cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
	end,
}
