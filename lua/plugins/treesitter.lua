return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        -- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
        -- parser_config.blip = {
        -- 	install_info = {
        -- 		url = '~/Development/projects/personal/tree-sitter/tree-sitter-blip/',
        -- 		files = { 'src/parser.c' },
        -- 		branch = 'main',
        -- 		generate_requires_npm = false,
        -- 		requires_generate_from_grammar = false,
        -- 	},
        -- 	filetype = 'blip',
        -- }
        --
        -- vim.filetype.add({
        -- 	extension = {
        -- 		blip = 'blip',
        -- 	},
        -- })

        local config = require('nvim-treesitter.configs')
        config.setup({
            auto_install = false,
            ensure_installed = 'all',
            ignore_install = { 'org', 'norg' },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
