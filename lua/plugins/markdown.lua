return {
	{
		'iamcco/markdown-preview.nvim',
		cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
		build = function()
			vim.fn['mkdp#util#install']()
		end,
		init = function()
			vim.g.mkdp_filetypes = { 'markdown' }
			vim.keymap.set('n', '<leader>lp', '<cmd>MarkdownPreviewToggle<CR>', { desc = '[P]review file' })
		end,
		ft = { 'markdown' },
	},
	{
		'MeanderingProgrammer/markdown.nvim',
		main = 'render-markdown',
		opts = {},
		name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
		ft = { 'markdown' },
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},
	{
		'zk-org/zk-nvim',
		ft = { 'markdown' },
		config = function()
			require('zk').setup {
				-- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
				-- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
				picker = 'telescope',

				lsp = {
					-- `config` is passed to `vim.lsp.start_client(config)`
					config = {
						cmd = { 'zk', 'lsp' },
						name = 'zk',
						-- on_attach = ...
						-- etc, see `:h vim.lsp.start_client()`
					},

					-- automatically attach buffers in a zk notebook that match the given filetypes
					auto_attach = {
						enabled = true,
						filetypes = { 'markdown' },
					},
				},
			}
		end,
	},
}
