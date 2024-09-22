return {
	{
		'saecki/crates.nvim',
		tag = 'stable',
		event = { 'BufRead Cargo.toml' },
		config = function()
			require('crates').setup()
		end,
	},
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						-- rust-analyzer language server configuration
						['rust-analyzer'] = {
							cargo = {
								allFeatures = true,
								features = { 'all', 'csr', 'ssr' },
								loadOutDirsFromCheck = true,
							},
							-- Add clippy lints for Rust.
							checkOnSave = true,
							procMacro = {
								enable = true,
								ignored = {
									['async-trait'] = { 'async_trait' },
									['napi-derive'] = { 'napi' },
									['async-recursion'] = { 'async_recursion' },
								},
							},
						},
					},
				},
			}
		end,
	},
}
