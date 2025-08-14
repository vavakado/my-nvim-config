return {
    {
        'nyoom-engineering/oxocarbon.nvim',
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        -- enabled = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('catppuccin')
        end,
    },
    {
        'zenbones-theme/zenbones.nvim',
        dependencies = 'rktjmp/lush.nvim',
    },
    {
        'rebelot/kanagawa.nvim',
    },
    {
        'savq/melange-nvim',
    },
    {
        'xero/miasma.nvim',
        branch = 'lua',
    },
}
