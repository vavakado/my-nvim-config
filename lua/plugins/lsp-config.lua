return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup {
				PATH = 'append',
			}
			local mason_registry = require 'mason-registry'
			mason_registry:on('package:install:success', function(pkg)
				pkg:get_receipt():if_present(function(receipt)
					for _, rel_path in pairs(receipt.links.bin) do
						local bin_abs_path = pkg:get_install_path() .. '/extension/server/bin/' .. rel_path
						os.execute(
							'patchelf --set-interpreter "$(patchelf --print-interpreter $(grep -oE \\/nix\\/store\\/[a-z0-9]+-neovim-unwrapped-[0-9]+\\.[0-9]+\\.[0-9]+\\/bin\\/nvim $(which nvim)))" '
								.. bin_abs_path
						)
					end
				end)
			end)
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = { 'lua_ls', 'gopls', 'csharp_ls' },
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
			lspconfig.csharp_ls.setup {
				root_dir = function(startpath)
					return lspconfig.util.root_pattern '*.sln'(startpath)
						or lspconfig.util.root_pattern '*.csproj'(startpath)
						or lspconfig.util.root_pattern '*.fsproj'(startpath)
						or lspconfig.util.root_pattern '.plastic'(startpath)
						or lspconfig.util.root_pattern '.git'(startpath)
				end,
				capabilities = capabilities,
			}

			vim.keymap.set('n', 'J', vim.lsp.buf.hover, { desc = 'Hover' })
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition' })
			vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code [A]ctions' })
		end,
	},
}
