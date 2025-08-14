return {
    {
        'folke/zen-mode.nvim',
        keys = {
            {
                '<leader>z',
                '<cmd>ZenMode<CR>',
                desc = 'Toggle Zen Mode',
            },
        },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            -- window = {
            -- 	options = {
            -- 		signcolumn = 'no', -- disable signcolumn
            -- 		number = true, -- disable number column
            -- 		relativenumber = true, -- disable relative numbers
            -- 		list = true, -- disable whitespace characters
            -- 	},
            -- },
            -- tmux = { enabled = true },
        },
    },
    {
        'folke/twilight.nvim',
        cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
        lazy = true,
        opts = {},
    },
}
