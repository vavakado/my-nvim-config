return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    config = function()
        vim.keymap.set('n', '<Leader>ot', ':Neotree filesystem toggle reveal right<CR>', { desc = 'Toggle Filetree' })
    end,
}
