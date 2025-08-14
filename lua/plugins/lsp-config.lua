return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
        local lspconfig = require('lspconfig')

        local function on_attach()
            vim.lsp.inlay_hint.enable(true)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Actions' })
            vim.keymap.set({ 'n', 'v' }, '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
        end

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = { globals = { 'vim' } },
                    workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                    telemetry = { enable = false },
                },
            },
        })

        lspconfig.elixirls.setup({
            on_attach = on_attach,
            cmd = { '/home/vavakado/.nix-profile/bin/elixir-ls' },
        })

        lspconfig.html.setup({
            filetypes = { 'html', 'heex' },
            on_attach = on_attach,
            init_options = {
                configurationSection = { 'html', 'css', 'javascript' },
                embeddedLanguages = {
                    css = true,
                    javascript = true,
                },
                provideFormatter = true,
            },
            settings = {
                html = {
                    format = {
                        unformatted = { 'pre', 'code', 'textarea' },
                    },
                },
            },
        })

        lspconfig.vtsls.setup({
            on_attach = on_attach,
            settings = {
                typescript = {
                    updateImportsOnFileMove = { enabled = 'always' },
                    inlayHints = {
                        parameterNames = { enabled = 'all' },
                        parameterTypes = { enabled = true },
                        variableTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        enumMemberValues = { enabled = true },
                    },
                },
                javascript = {
                    updateImportsOnFileMove = { enabled = 'always' },
                    inlayHints = {
                        parameterNames = { enabled = 'literals' },
                        parameterTypes = { enabled = true },
                        variableTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        enumMemberValues = { enabled = true },
                    },
                },
                vtsls = {
                    enableMoveToFileCodeAction = true,
                },
            },
        })

        lspconfig.harper_ls.setup({
            on_attach = on_attach,
            settings = {
                ['harper-ls'] = {
                    linters = {
                        AvoidCurses = false,
                        -- SentenceCapitalization = false,
                        -- SpellCheck = false,
                    },
                },
            },
            filetypes = { 'markdown' },
        })

        lspconfig.qmlls.setup({
            on_attach = on_attach,
            cmd = { 'qmlls', '-E' },
        })

        local servers = {
            'clangd',
            'cssls',
            'docker_compose_language_service',
            'dockerls',
            'jsonls',
            'nixd',
            'ocamllsp',
            'ols',
        }
        if vim.fn.executable('zls') == 1 then
            servers[#servers + 1] = 'zls'
        end

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                on_attach = on_attach,
            })
        end
    end,
}
