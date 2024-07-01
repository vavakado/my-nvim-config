return {
	'nvimtools/none-ls.nvim',
	config = function()
		local null_ls = require 'null-ls'
		local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
		null_ls.setup {
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.astyle,
				null_ls.builtins.formatting.nixfmt,
				-- null_ls.builtins.diagnostics.selene,
			},
			on_attach = function(client, bufnr)
				if client.supports_method 'textDocument/formatting' then
					vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
					vim.api.nvim_create_autocmd('BufWritePre', {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.format { async = false }
						end,
					})
				end
			end,
		}
		vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = '[F]ormat' })
	end,
}
