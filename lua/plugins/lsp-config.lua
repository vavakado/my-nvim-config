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
				ensure_installed = { 'lua_ls', 'jsonls', 'prettierd', 'stylua', 'html-lsp', 'cssls', 'marksman', 'gopls', 'csharp_ls' },
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
			lspconfig.rust_analyzer.setup {
				capabilities = capabilities,
				config = {
					rust_analyzer = {
						settings = {
							['rust-analyzer'] = {
								check = {
									command = 'clippy',
									extraArgs = {
										'--no-deps',
									},
								},
								assist = {
									importEnforceGranularity = true,
									importPrefix = 'crate',
								},
								completion = {
									postfix = {
										enable = false,
									},
								},
								inlayHints = {
									lifetimeElisionHints = {
										enable = true,
										useParameterNames = true,
									},
								},
							},
						},
					},
				},
				on_attach = function(client, bufnr)
					vim.lsp.inlay_hint.enable(true)
				end,
				root_dir = function(startpath)
					return lspconfig.util.root_pattern 'Cargo.toml' (startpath) or
					lspconfig.util.root_pattern '.git' (startpath)
				end,
			}
			lspconfig.csharp_ls.setup {
				root_dir = function(startpath)
					return lspconfig.util.root_pattern '*.sln' (startpath)
						or lspconfig.util.root_pattern '*.csproj' (startpath)
						or lspconfig.util.root_pattern '*.fsproj' (startpath)
						or lspconfig.util.root_pattern '.plastic' (startpath)
						or lspconfig.util.root_pattern '.git' (startpath)
				end,
				capabilities = capabilities,
			}

			vim.keymap.set('n', 'J', vim.lsp.buf.hover, { desc = 'Hover' })
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition' })
			vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code [A]ctions' })
		end,
	},
}
