return {
	{
		'williamboman/mason.nvim',
		enabled = false,
		config = function()
			require('mason').setup({
				PATH = 'append',
			})
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		enabled = false,
		config = function()
			require('mason-lspconfig').setup({
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
			})
		end,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = { 'saghen/blink.cmp' },
		config = function()
			local lspconfig = require('lspconfig')

			local function on_attach()
				vim.lsp.inlay_hint.enable(true)
				vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
					{ noremap = true, silent = true })
				vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
					{ noremap = true, silent = true })
				vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Actions' })
				vim.keymap.set({ 'n', 'v' }, '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
			end

			lspconfig.elixirls.setup({
				on_attach = on_attach,
				cmd = { '/home/vavakado/.nix-profile/bin/elixir-ls' },
			})

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = { version = 'LuaJIT' },
						diagnostics = { globals = { 'vim' } },
						workspace = { library = vim.api.nvim_get_runtime_file('', true) },
						telemetry = { enable = false },
					},
				},
			})

			lspconfig.html.setup({
				filetypes = { 'html', 'heex' },
				init_options = {
					configurationSection = { 'html', 'css', 'javascript' },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = true,
				},
				settings = {
					html = {
						format = {
							unformatted = { 'pre', 'code', 'textarea' },
						},
					},
				},
			})

			lspconfig.hls.setup({
				on_attach = on_attach,
				settings = {
					haskell = {
						cabalFormattingProvider = 'cabalfmt',
						formattingProvider = 'fourmolu',
					},
				},
			})

			lspconfig.vtsls.setup({
				on_attach = on_attach,
				settings = {
					typescript = {
						updateImportsOnFileMove = { enabled = 'always' },
						inlayHints = {
							parameterNames = { enabled = 'all' },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
					javascript = {
						updateImportsOnFileMove = { enabled = 'always' },
						inlayHints = {
							parameterNames = { enabled = 'literals' },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
					vtsls = {
						enableMoveToFileCodeAction = true,
					},
				},
			})

			lspconfig.harper_ls.setup({
				on_attach = on_attach,
				settings = {
					['harper-ls'] = {
						linters = {
							AvoidCurses = false,
							-- SentenceCapitalization = false,
							-- SpellCheck = false,
						},
					},
				},
				filetypes = { 'markdown' },
			})

			lspconfig.qmlls.setup({
				cmd = { 'qmlls', '-E' },
			})

			local servers = {
				'astro',
				'clangd',
				'fennel_ls',
				'csharp_ls',
				'cssls',
				'docker_compose_language_service',
				'dockerls',
				'gdscript',
				'glsl_analyzer',
				'gopls',
				'jsonls',
				'marksman',
				'nixd',
				'pylsp',
				'sqlls',
				'svelte',
				'zls',
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
				})
			end
		end,
	},
}
