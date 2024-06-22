vim.o.clipboard = 'unnamedplus'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.nu = true
vim.o.rnu = true

vim.g.mapleader = ' '

if vim.g.neovide then
	vim.o.guifont = 'Iosevka Nerd Font Mono:h15'
end

vim.keymap.set('', 'f', 'e')
vim.keymap.set('', 'p', 'r')
vim.keymap.set('', 'g', 't')
vim.keymap.set('', 'j', 'y')
vim.keymap.set('', 'l', 'u')
vim.keymap.set('', 'u', 'i')
vim.keymap.set('', 'y', 'o')
vim.keymap.set('', 'r', 's')
vim.keymap.set('', 's', 'd')
vim.keymap.set('', 't', 'f')
vim.keymap.set('', 'd', 'g')
vim.keymap.set('', 'h', 'h')
vim.keymap.set('', 'n', 'j')
vim.keymap.set('', 'e', 'k')
vim.keymap.set('', 'i', 'l')
vim.keymap.set('', 'o', 'p')
vim.keymap.set('', 'k', 'n')
vim.keymap.set('', 'F', 'E')
vim.keymap.set('', 'P', 'R')
vim.keymap.set('', 'G', 'T')
vim.keymap.set('', 'J', 'Y')
vim.keymap.set('', 'L', 'U')
vim.keymap.set('', 'U', 'I')
vim.keymap.set('', 'Y', 'O')
vim.keymap.set('', 'R', 'S')
vim.keymap.set('', 'S', 'D')
vim.keymap.set('', 'T', 'F')
vim.keymap.set('', 'D', 'G')
vim.keymap.set('', 'H', 'H')
vim.keymap.set('', 'N', 'J')
vim.keymap.set('', 'E', 'K')
vim.keymap.set('', 'I', 'L')
vim.keymap.set('', 'O', 'P')
vim.keymap.set('', 'K', 'N')
vim.o.langmap =
	'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
vim.o.langremap = true
