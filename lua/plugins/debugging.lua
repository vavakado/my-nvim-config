return {
	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap = require('dap')
			vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = 'Breakpoint' })
			vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = 'Continue' })
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
