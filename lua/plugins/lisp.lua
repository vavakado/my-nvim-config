return {
	{
		'Olical/conjure',
		ft = { 'fennel', 'python' }, -- etc
		lazy = true,
		init = function()
			-- Set configuration options here
			-- Uncomment this to get verbose logging to help diagnose internal Conjure issues
			-- This is VERY helpful when reporting an issue with the project
			-- vim.g["conjure#debug"] = true

			vim.g['conjure#filetype#fennel'] = 'conjure.client.fennel.stdio'
		end,

		-- Optional cmp-conjure integration
		dependencies = { 'PaterJason/cmp-conjure' },
	},
	{
		'dundalek/parpar.nvim',
		dependencies = { 'gpanders/nvim-parinfer', 'julienvincent/nvim-paredit' },
		config = function()
			local paredit = require('nvim-paredit')
			require('parpar').setup({
				paredit = {
					-- pass any nvim-paredit options here
					keys = {
						-- custom bindings are automatically wrapped
						['<A-H>'] = { paredit.api.slurp_backwards, 'Slurp backwards' },
						['<A-J>'] = { paredit.api.barf_backwards, 'Barf backwards' },
						['<A-K>'] = { paredit.api.barf_forwards, 'Barf forwards' },
						['<A-L>'] = { paredit.api.slurp_forwards, 'Slurp forwards' },
					},
				},
			})
		end,
	},
	-- {
	-- 	'monkoose/nvlime',
	--
	-- 	dependencies = { 'monkoose/parsley' },
	-- 	ft = { 'lisp' },
	-- 	init = function()
	-- 		vim.g.nvlime_config = {
	-- 			cmp = {
	-- 				enabled = true,
	-- 			},
	-- 		}
	-- 	end,
	-- },
	-- {
	-- 	'gpanders/nvim-parinfer',
	-- 	ft = { 'lisp' },
	-- },
}
