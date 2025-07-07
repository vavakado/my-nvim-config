return {
	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap = require('dap')
			vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = 'Breakpoint' })
			vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = 'Continue' })

			dap.adapters.codelldb = {
				type = 'executable',
				command = '/home/vavakado/Downloads/codelldb-linux-x64_1.vsix/extension/adapter/codelldb',
			}

			-- dap.adapters.lldb = {
			-- 	type = 'executable',
			-- 	command = '/nix/store/kyf2xqd0kv10zzrfbi3q45jd6v1pw3l6-system-path/bin/lldb', -- Adjust this path as needed
			-- 	name = 'lldb',
			-- }
			--
			-- dap.configurations.cpp = {
			-- 	{
			-- 		name = 'Launch',
			-- 		type = 'lldb',
			-- 		request = 'launch',
			-- 		program = function()
			-- 			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			-- 		end,
			-- 		cwd = '${workspaceFolder}',
			-- 		stopOnEntry = false,
			-- 		args = {},
			-- 		runInTerminal = true,
			-- 	},
			-- }
		end,
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
		config = function()
			local dap, dapui = require('dap'), require('dapui')
			require('dapui').setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
