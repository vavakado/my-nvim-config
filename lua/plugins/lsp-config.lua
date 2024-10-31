return {
	{
		'williamboman/mason.nvim',
		enabled = false,
		config = function()
			require('mason').setup {
				PATH = 'append',
			}
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		enabled = false,
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = {
					'cssls',
					'docker_compose_language_service',
					'dockerls',
					'gopls',
					'html',
					'jsonls',
					'lua_ls',
					'marksman',
					'tailwindcss',
					'ts_ls',
				},
			}
		end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require 'lspconfig'
			local cmp_nvim_lsp = require 'cmp_nvim_lsp'

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local function on_attach()
				vim.lsp.inlay_hint.enable(true)
				vim.keymap.set('n', 'J', vim.lsp.buf.hover, { desc = 'Hover' })
				vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
				vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
				vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code [A]ctions' })
				vim.keymap.set({ 'n', 'v' }, '<leader>lr', vim.lsp.buf.rename, { desc = '[R]ename' })
			end

			lspconfig.elixirls.setup {
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { '/home/vavakado/.nix-profile/bin/elixir-ls' },
			}

			local servers = {
				'csharp_ls',
				'cssls',
				'docker_compose_language_service',
				'dockerls',
				'gdscript',
				'gopls',
				'html',
				'jsonls',
				'marksman',
				'nixd',
				'tailwindcss',
				'ts_ls',
				'zls',
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					capabilities = capabilities,
					on_attach = on_attach,
				}
			end
		end,
	},
}
