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
			local lspconfig = require 'lspconfig'
			local cmp_nvim_lsp = require 'cmp_nvim_lsp'

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local servers = {
				'lua_ls',
				'gopls',
				'marksman',
				'html',
				'tailwindcss',
				'cssls',
				'jsonls',
				'csharp_ls',
				'gdscript',
				'tsserver',
				'docker_compose_language_service',
				'dockerls',
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					capabilities = capabilities,
				}
			end

			vim.lsp.inlay_hint.enable(true)
			vim.keymap.set('n', 'J', vim.lsp.buf.hover, { desc = 'Hover' })
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition' })
			vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code [A]ctions' })
			vim.keymap.set({ 'n', 'v' }, '<leader>lr', vim.lsp.buf.rename, { desc = '[R]ename' })
		end,
	},
}
