return {
	{
		'jiaoshijie/undotree',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			require('undotree').setup()
			vim.keymap.set('n', '<leader>uu', "<cmd>lua require('undotree').toggle()<cr>", { desc = 'Toggle Undotree' })
		end,
		--		keys = { -- load the plugin only when using it's keybinding:
		--			{ '<leader>uu', "<cmd>lua require('undotree').toggle()<cr>" },
		--		},
	},
}
