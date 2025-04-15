return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,

	---@class snacks.Config
	---@field bigfile? snacks.bigfile.Config | { enabled: boolean }
	---@field gitbrowse? snacks.gitbrowse.Config
	---@field lazygit? snacks.lazygit.Config
	---@field notifier? snacks.notifier.Config | { enabled: boolean }
	---@field quickfile? { enabled: boolean }
	---@field statuscolumn? snacks.statuscolumn.Config  | { enabled: boolean }
	---@field styles? table<string, snacks.win.Config>
	---@field dashboard? snacks.dashboard.Config  | { enabled: boolean }
	---@field terminal? snacks.terminal.Config
	---@field toggle? snacks.toggle.Config
	---@field win? snacks.win.Config
	---@field words? snacks.words.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = true },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		gitbrowse = {
			-- Handler to open the url in a browser
			---@param url string
			open = function(url)
				if vim.fn.has('nvim-0.10') == 0 then
					require('lazy.util').open(url, { system = true })
					return
				end
				vim.ui.open(url)
			end,
			---@type "repo" | "branch" | "file" | "commit"
			what = 'file', -- what to open. not all remotes support all types
			-- patterns to transform remotes to an actual URL
			remote_patterns = {
				{ '^(https?://.*)%.git$', '%1' },
				{ '^git@(.+):(.+)%.git$', 'https://%1/%2' },
				{ '^git@(.+):(.+)$', 'https://%1/%2' },
				{ '^git@(.+)/(.+)$', 'https://%1/%2' },
				{ '^ssh://git@(.*)$', 'https://%1' },
				{ '^ssh://([^:/]+)(:%d+)/(.*)$', 'https://%1/%3' },
				{ '^ssh://([^/]+)/(.*)$', 'https://%1/%2' },
				{ 'ssh%.dev%.azure%.com/v3/(.*)/(.*)$', 'dev.azure.com/%1/_git/%2' },
				{ '^https://%w*@(.*)', 'https://%1' },
				{ '^git@(.*)', 'https://%1' },
				{ ':%d+', '' },
				{ '%.git$', '' },
			},
			url_patterns = {
				['github%.com'] = {
					branch = '/tree/{branch}',
					file = '/blob/{branch}/{file}#L{line_start}-L{line_end}',
					permalink = '/blob/{commit}/{file}#L{line_start}-L{line_end}',
					commit = '/commit/{commit}',
				},
				['gitlab%.com'] = {
					branch = '/-/tree/{branch}',
					file = '/-/blob/{branch}/{file}#L{line_start}',
					commit = '/-/commit/{commit}',
				},
				['bitbucket%.org'] = {
					branch = '/src/{branch}',
					file = '/src/{branch}/{file}#lines-{line_start}',
					commit = '/commits/{commit}',
				},
				['git.vavakado.xyz'] = {
					branch = '/src/branch/{branch}',
					file = '/src/branch/{branch}/{file}#L{line_start}',
					commit = '/commit/{commit}',
				},
			},
		},
	},

	keys = {
		{
			'<leader>go',
			'<cmd>lua require("snacks").gitbrowse()<CR>',
			desc = 'Git browse',
		},
	},
}
