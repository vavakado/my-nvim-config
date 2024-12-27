vim.o.clipboard = 'unnamedplus'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- relative numbers
vim.o.nu = true
vim.o.rnu = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.showmode = false

vim.o.breakindent = true
vim.o.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitution
vim.opt.inccommand = 'split'

vim.o.scrolloff = 7

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>uw', '<cmd>set wrap!<CR>', { desc = 'Toggle [W]rap' })
vim.keymap.set('n', '<leader>ur', '<cmd>set rnu!<CR>', { desc = 'Toggle [R]elative [N]umbers' })
vim.keymap.set('n', '<leader>un', '<cmd>set nu!<CR>', { desc = 'Toggle [N]umbers' })
vim.keymap.set('n', '<leader>q', '<cmd>qa<CR>', { noremap = true, silent = true, desc = 'Quit' })

local function toggle_inlay_hints()
	if vim.lsp.inlay_hint.is_enabled() then
		vim.lsp.inlay_hint.enable(false)
	else
		vim.lsp.inlay_hint.enable(true)
	end
end

vim.keymap.set('n', '<leader>uh', toggle_inlay_hints, { desc = 'Toggle [I]nline [H]ints' })

vim.opt.breakindent = true
vim.opt.showbreak = '↪ '

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'latex', 'markdown' },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
})

if vim.g.neovide then
	vim.o.guifont = 'Iosevka Nerd Font Mono:h16'
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_cursor_vfx_mode = 'pixiedust'
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set('n', '<C-=>', function()
		change_scale_factor(1.02)
	end)
	vim.keymap.set('n', '<C-->', function()
		change_scale_factor(1 / 1.02)
	end)
end

-- vim.keymap.set('', 'f', 'e')
-- vim.keymap.set('', 'p', 'r')
-- vim.keymap.set('', 'g', 't')
-- vim.keymap.set('', 'j', 'y')
-- vim.keymap.set('', 'l', 'u')
-- vim.keymap.set('', 'u', 'i')
-- vim.keymap.set('', 'y', 'o')
-- vim.keymap.set('', 'r', 's')
-- vim.keymap.set('', 's', 'd')
-- vim.keymap.set('', 't', 'f')
-- vim.keymap.set('', 'd', 'g')
-- vim.keymap.set('', 'h', 'h')
-- vim.keymap.set('', 'n', 'j')
-- vim.keymap.set('', 'e', 'k')
-- vim.keymap.set('', 'i', 'l')
-- vim.keymap.set('', 'o', 'p')
-- vim.keymap.set('', 'k', 'n')
-- vim.keymap.set('', 'F', 'E')
-- vim.keymap.set('', 'P', 'R')
-- vim.keymap.set('', 'G', 'T')
-- vim.keymap.set('', 'J', 'Y')
-- vim.keymap.set('', 'L', 'U')
-- vim.keymap.set('', 'U', 'I')
-- vim.keymap.set('', 'Y', 'O')
-- vim.keymap.set('', 'R', 'S')
-- vim.keymap.set('', 'S', 'D')
-- vim.keymap.set('', 'T', 'F')
-- vim.keymap.set('', 'D', 'G')
-- vim.keymap.set('', 'H', 'H')
-- vim.keymap.set('', 'N', 'J')
-- vim.keymap.set('', 'E', 'K')
-- vim.keymap.set('', 'I', 'L')
-- vim.keymap.set('', 'O', 'P')
-- vim.keymap.set('', 'K', 'N')

-- vim.keymap.set('', 'n', 'j')
-- vim.keymap.set('', 'e', 'k')
-- vim.keymap.set('', 'i', 'l')
-- vim.keymap.set('', 'j', 'e')
-- vim.keymap.set('', 'k', 'n')
-- vim.keymap.set('', 'l', 'i')
--
-- vim.keymap.set('', 'N', 'J')
-- vim.keymap.set('', 'E', 'K')
-- vim.keymap.set('', 'I', 'L')
-- vim.keymap.set('', 'J', 'E')
-- vim.keymap.set('', 'K', 'N')
-- vim.keymap.set('', 'L', 'I')

vim.o.langmap =
	'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
vim.o.langremap = true

-- Create an augroup for highlighting yanked text
local highlight_yank_group = vim.api.nvim_create_augroup('highlight_yank', { clear = true })

-- Create an autocommand for the TextYankPost event
vim.api.nvim_create_autocmd('TextYankPost', {
	group = highlight_yank_group,
	callback = function()
		vim.highlight.on_yank({ higroup = 'Visual', timeout = 150 })
	end,
})

local function closeAllBuffersButCurrentOne()
	local current_buf = vim.api.nvim_get_current_buf()
	local all_bufs = vim.api.nvim_list_bufs()

	for _, buf in ipairs(all_bufs) do
		if buf ~= current_buf then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end

vim.keymap.set('n', '<leader>bx', closeAllBuffersButCurrentOne, { desc = 'Close all buffers but current one' })

vim.api.nvim_create_user_command('W', 'w', {}) -- i keep mistyping this
