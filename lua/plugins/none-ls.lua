return {
	'nvimtools/none-ls.nvim',
	config = function()
		local null_ls = require('null-ls')
		local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.credo,

				null_ls.builtins.formatting.mix,
				null_ls.builtins.formatting.prettierd.with({
					extra_filetypes = { 'svelte', 'typescriptreact', 'astro' },
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.nixfmt,
				null_ls.builtins.formatting.gdformat,
				null_ls.builtins.formatting.gofmt,

				null_ls.builtins.formatting.sqlfluff.with({
					extra_args = { '--dialect', 'postgres' }, -- change to your dialect
				}),
				null_ls.builtins.diagnostics.sqlfluff.with({
					extra_args = { '--dialect', 'postgres' }, -- change to your dialect
				}),

				-- pypthon
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.formatting.black,
			},
			on_attach = function(client, bufnr)
				if client.supports_method('textDocument/formatting') then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd('BufWritePre', {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
		vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format' })
	end,
}
