return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        require('which-key').setup()
        local wk = require('which-key')

        wk.add({
            { '<leader>f', group = 'Find' },
            { '<leader>f_', hidden = true },
            { '<leader>g', group = 'Git' },
            { '<leader>g_', hidden = true },
            { '<leader>l', group = 'LSP' },
            { '<leader>l_', hidden = true },
            { '<leader>u', group = 'Ui' },
            { '<leader>u_', hidden = true },
            { '<leader>b', group = 'Buffers' },
            { '<leader>b_', hidden = true },
            { '<leader>o', group = 'Open' },
            { '<leader>o_', hidden = true },
        })
    end,
}
