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

vim.keymap.set('n', '<leader>uw', '<cmd>set wrap!<CR>', { desc = 'Toggle Wrap' })
vim.keymap.set('n', '<leader>ur', '<cmd>set rnu!<CR>', { desc = 'Toggle Relative Numbers' })
vim.keymap.set('n', '<leader>un', '<cmd>set nu!<CR>', { desc = 'Toggle Line Numbers' })
vim.keymap.set('n', '<leader>q', '<cmd>qa<CR>', { noremap = true, silent = true, desc = 'Quit' })

local function toggle_inlay_hints()
	if vim.lsp.inlay_hint.is_enabled() then
		vim.lsp.inlay_hint.enable(false)
	else
		vim.lsp.inlay_hint.enable(true)
	end
end

vim.keymap.set('n', '<leader>uh', toggle_inlay_hints, { desc = 'Toggle Inline Hints' })

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

vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
-- vim.api.nvim_set_keymap('', '<space><space>', [[:]], { noremap = true }) -- maybe later?? idk

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

-- vim.o.foldcolumn = 'auto'
-- vim.o.foldlevel = 99
-- vim.o.foldlevelstart = 99
vim.o.foldenable = false

vim.opt.numberwidth = 3
