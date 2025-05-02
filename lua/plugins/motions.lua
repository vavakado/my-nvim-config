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
				modes = { char = { enabled = false } },
			})
		end,
		-- stylua: ignore
		keys = {
			{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},
}
