return {
    {
        'folke/trouble.nvim',
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = 'Trouble',
        keys = {
            {
                '<leader>lx',
                '<cmd>Trouble diagnostics toggle<cr>',
                desc = 'Diagnostics',
            },
            {
                '<leader>lX',
                '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
                desc = 'Buffer Diagnostics',
            },
            {
                '<leader>ls',
                '<cmd>Trouble symbols toggle focus=false<cr>',
                desc = 'Symbols',
            },
        },
    },
}
