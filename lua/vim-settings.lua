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

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'haskell',
	callback = function()
		vim.opt_local.expandtab = true -- Use spaces instead of tabs
		vim.opt_local.shiftwidth = 2 -- Number of spaces for indentation
		vim.opt_local.softtabstop = 2 -- Number of spaces per tab press
		vim.opt_local.tabstop = 2 -- Number of spaces a tab represents
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'markdown',
	callback = function()
		vim.opt_local.expandtab = true -- Use spaces instead of tabs
		vim.opt_local.shiftwidth = 2 -- Number of spaces for indentation
		vim.opt_local.softtabstop = 2 -- Number of spaces per tab press
		vim.opt_local.tabstop = 2 -- Number of spaces a tab represents
	end,
})

local function open_todays_note()
	local date = os.date('%Y-%m-%d')
	local notes_dir = '~/Documents/notes/daily/'
	local note_path = notes_dir .. date .. '.md'

	vim.cmd('e ' .. vim.fn.expand(note_path))
end

-- Create the :NoteToday command
vim.api.nvim_create_user_command('NoteToday', open_todays_note, { desc = "Open today's note" })

-- Function to extract the timestamp from the filename
local function get_timestamp(filename)
	local year, month, day, hour, min, sec = filename:match('(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)')
	if year and month and day and hour and min and sec then
		return year, month, day, hour, min, sec
	else
		return nil
	end
end

-- Function to compare two filenames based on their timestamps
local function compare_files(file1, file2)
	local year1, month1, day1, hour1, min1, sec1 = get_timestamp(file1)
	local year2, month2, day2, hour2, min2, sec2 = get_timestamp(file2)

	-- Compare each component (year, month, day, hour, minute, second)
	if year1 ~= year2 then
		return year1 > year2
	end
	if month1 ~= month2 then
		return month1 > month2
	end
	if day1 ~= day2 then
		return day1 > day2
	end
	if hour1 ~= hour2 then
		return hour1 > hour2
	end
	if min1 ~= min2 then
		return min1 > min2
	end
	return sec1 > sec2
end

local source_dir = '/home/vavakado/Pictures/Screenshots'
local target_dir = '/home/vavakado/Documents/notes/pics'

-- Function to copy the latest screenshot
local function copy_latest_screenshot()
	local latest_file
	local screenshots = vim.fn.glob(source_dir .. '/*.png', true, true) -- List all .png files in the source directory

	for _, file in ipairs(screenshots) do
		local filename = vim.fn.fnamemodify(file, ':t') -- Get the file name without path
		local year, month, day, hour, min, sec = get_timestamp(filename)

		-- Only consider files with valid timestamp format
		if year then
			if not latest_file or compare_files(filename, latest_file) then
				latest_file = filename
			end
		end
	end

	if latest_file then
		local source_path = source_dir .. '/' .. latest_file
		local target_path = target_dir .. '/' .. latest_file

		-- Copy the file
		local success, err = vim.loop.fs_copyfile(source_path, target_path)
		if success then
			print('Copied ' .. latest_file .. ' to ' .. target_path)
		else
			print('Failed to copy ' .. latest_file .. ': ' .. err)
		end
	else
		print('No valid screenshots found')
	end
end

vim.api.nvim_create_user_command('CopyLatestScreenshot', copy_latest_screenshot, { desc = 'Copy the latest screenshot' })
