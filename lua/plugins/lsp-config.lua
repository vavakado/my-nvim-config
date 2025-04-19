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

			-- local cmp_nvim_lsp = require('cmp_nvim_lsp')

			-- local capabilities = cmp_nvim_lsp.default_capabilities()

			local function on_attach(client)
				vim.lsp.inlay_hint.enable(true)
				-- vim.keymap.set('n', 'J', vim.lsp.buf.hover, { desc = 'Hover' })
				vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
				vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
				vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Actions' })
				vim.keymap.set({ 'n', 'v' }, '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })

				-- if client.server_capabilities.colorProvider then
				-- 	-- Attach document colour support
				-- 	require('document-color').buf_attach(bufnr)
				-- end
			end

			lspconfig.elixirls.setup({
				-- capabilities = capabilities,
				on_attach = on_attach,
				cmd = { '/home/vavakado/.nix-profile/bin/elixir-ls' },
			})

			-- lspconfig.lexical.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	cmd = { '/home/vavakado/.nix-profile/bin/lexical' },
			-- })
			--
			--

			-- lspconfig.tailwindcss.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { 'html', 'elixir', 'heex', 'svelte' },
			-- 	init_options = {
			-- 		userLanguages = {
			-- 			elixir = 'phoenix-heex',
			-- 			heex = 'phoenix-heex',
			-- 			svelte = 'svelte',
			-- 		},
			-- 	},
			-- 	settings = {
			-- 		tailwindCSS = {
			-- 			experimental = {
			-- 				classRegex = {
			-- 					'class="([^"]*)"',
			-- 					'class: "([^"]*)"',
			-- 					'~H""".*class="([^"]*)".*"""',
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- })

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
				-- capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					haskell = {
						cabalFormattingProvider = 'cabalfmt',
						formattingProvider = 'fourmolu',
					},
				},
			})

			local servers = {
				'clangd',
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
				'ts_ls',
				'zls',
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					-- capabilities = capabilities,
					on_attach = on_attach,
				})
			end
		end,
	},
}
