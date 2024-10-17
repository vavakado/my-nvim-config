return {
	'epwalsh/pomo.nvim',
	version = '*', -- Recommended, use latest release instead of latest commit
	lazy = true,
	cmd = { 'TimerStart', 'TimerRepeat', 'TimerSession' },
	dependencies = {
		-- Optional, but highly recommended if you want to use the "Default" timer
		'rcarriga/nvim-notify',
	},
	keys = {
		{
			'<leader>pn',
			'<cmd>TimerSession pomodoro<CR>',
			desc = 'New Pomo session',
		},
		{
			'<leader>pp',
			'<cmd>TimerPause<CR>',
			desc = 'Pause Pomo session',
		},
		{
			'<leader>pr',
			'<cmd>TimerResume<CR>',
			desc = 'Resume Pomo session',
		},
		{
			'<leader>ps',
			'<cmd>TimerStop<CR>',
			desc = 'Stop Pomo session',
		},
		{
			'<leader>ph',
			'<cmd>TimerHide<CR>',
			desc = 'Hide Pomo',
		},
		{
			'<leader>pH',
			'<cmd>TimerShow<CR>',
			desc = 'Show Pomo',
		},
	},
	opts = {
		notifiers = {
			-- The "Default" notifier uses 'vim.notify' and works best when you have 'nvim-notify' installed.
			{
				name = 'Default',
				opts = {
					-- With 'nvim-notify', when 'sticky = true' you'll have a live timer pop-up
					-- continuously displayed. If you only want a pop-up notification when the timer starts
					-- and finishes, set this to false.
					sticky = true,

					-- Configure the display icons:
					title_icon = '󱎫',
					text_icon = '󰄉',
					-- Replace the above with these if you don't have a patched font:
					-- title_icon = "⏳",
					-- text_icon = "⏱️",
				},
			},
			{ name = 'System' },
		},
		sessions = {
			pomodoro = {
				{ name = 'Work', duration = '25m' },
				{ name = 'Short Break', duration = '5m' },
				{ name = 'Work', duration = '25m' },
				{ name = 'Short Break', duration = '5m' },
				{ name = 'Work', duration = '25m' },
				{ name = 'Long Break', duration = '15m' },
			},
		},
	},
}
