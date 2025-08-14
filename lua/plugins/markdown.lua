return {
    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
            vim.keymap.set('n', '<leader>lp', '<cmd>MarkdownPreviewToggle<CR>', { desc = 'Preview file' })
        end,
        ft = { 'markdown' },
    },
    {
        'MeanderingProgrammer/markdown.nvim',
        main = 'render-markdown',
        opts = {},
        name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
        ft = { 'markdown' },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },
}
