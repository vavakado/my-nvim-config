return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup {
				PATH = 'append',
			}
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = { 'lua_ls', 'jsonls', 'html', 'cssls', 'marksman', 'gopls' },
			}
		end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require 'lspconfig'
			lspconfig.lua_ls.setup {
				capabilities = capabilities,
			}
			lspconfig.gopls.setup {
				capabilities = capabilities,
			}
			lspconfig.marksman.setup {
				capabilities = capabilities,
			}
			lspconfig.html.setup {
				capabilities = capabilities,
			}
			lspconfig.cssls.setup {
				capabilities = capabilities,
			}
			lspconfig.jsonls.setup {
				capabilities = capabilities,
			}
			lspconfig.csharp_ls.setup {
				capabilities = capabilities,
			}
			lspconfig.gdscript.setup {
				capabilities = capabilities,
			}
			vim.keymap.set('n', 'J', vim.lsp.buf.hover, { desc = 'Hover' })
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition' })
			vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code [A]ctions' })
			vim.keymap.set({ 'n', 'v' }, '<leader>lr', vim.lsp.buf.rename, { desc = '[R]ename' })
		end,
	},
}
