return {
	-- {
	-- 	'chrisgrieser/nvim-spider',
	-- 	lazy = true,
	-- 	keys = {
	-- 		{
	-- 			'f',
	-- 			"<cmd>lua require('spider').motion('e')<CR>",
	-- 			mode = { 'n', 'o', 'x' },
	-- 		},
	-- 		{
	-- 			'w',
	-- 			"<cmd>lua require('spider').motion('w')<CR>",
	-- 			mode = { 'n', 'o', 'x' },
	-- 		},
	-- 		{
	-- 			'b',
	-- 			"<cmd>lua require('spider').motion('b')<CR>",
	-- 			mode = { 'n', 'o', 'x' },
	-- 		},
	-- 	},
	-- },
	{
		'folke/flash.nvim',
		event = 'VeryLazy',
		enabled = false,
		opts = {
			label = {
				rainbow = {
					enabled = true,
				},
			},
		},
		config = function()
			require('flash').setup({
				label = { rainbow = { enabled = true } },
			})
			vim.cmd('unmap F')
			vim.cmd('unmap f')
			vim.cmd('unmap t')
			vim.cmd('unmap T')
		end,
		-- stylua: ignore
		keys = {
			{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			-- { "<c-g>", mode = { "n", "x", "o" }, function() require("flash").jump({search = { mode = "search", max_length = 0 },label = { after = { 0, 0 } },pattern = "^"}) end, desc = "flash line" },
			{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "p",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "P",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-x>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},
}
