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
}
