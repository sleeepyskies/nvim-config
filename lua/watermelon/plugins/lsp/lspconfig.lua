-- Configures any LSPs
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true },
        { 'folke/lazydev.nvim', opts = {} },
    },
    config = function()
        local lspconfig = require('lspconfig')
        local mason_lspconfig = require('mason-lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local keymap = vim.keymap

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = 'Show LSP references'
                keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

                opts.desc = 'Go to declaration'
                keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

                opts.desc = 'Show LSP definitions'
                keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

                opts.desc = 'Show LSP implementations'
                keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

                opts.desc = 'Show LSP type definitions'
                keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

                opts.desc = 'See available code actions'
                keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

                opts.desc = 'Smart rename'
                keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

                opts.desc = 'Show buffer diagnostics'
                keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

                opts.desc = 'Show line diagnostics'
                keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

                opts.desc = 'Go to previous diagnostic'
                keymap.set('n', '[d', function()
                    vim.diagnostic.jump({ count = -1, float = true })
                end, opts)

                opts.desc = 'Go to next diagnostic'
                keymap.set('n', ']d', function()
                    vim.diagnostic.jump({ count = 1, float = true })
                end, opts)

                opts.desc = 'Show documentation for what is under cursor'
                keymap.set('n', 'K', vim.lsp.buf.hover, opts)

                opts.desc = 'Restart LSP'
                keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.HINT] = '',
                    [vim.diagnostic.severity.INFO] = '',
                },
                linehl = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.HINT] = '',
                    [vim.diagnostic.severity.INFO] = '',
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
                    [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
                    [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
                    [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
                },
            },
            virtual_text = true,
        })

        mason_lspconfig.setup_handlers({
            -- default handler
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            -- any any special lsp configs here, only if the default is not enough

            -- lua
            ['lua_ls'] = function()
                -- custom lua config
                lspconfig['lua_ls'].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make the language server recognize 'vim' global
                            diagnostics = {
                                globals = { 'vim' },
                            },
                            completion = {
                                callSnippet = 'Replace',
                            },
                        },
                    },
                    on_init = function(client)
                        if client.workspace_folders then
                            local path = client.workspace_folders[1].name
                            if
                                path ~= vim.fn.stdpath('config')
                                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                            then
                                return
                            end
                        end

                        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                            },
                            -- make the server aware of neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                    '${3rd}/luv/library',
                                },
                            },
                        })
                    end,
                })
            end,

            -- harper, English language
            ['harper_ls'] = function()
                lspconfig['harper_ls'].setup({
                    capabilities = capabilities,
                    settings = {
                        ['harper-ls'] = {
                            linters = {
                                SentenceCapitalization = false,
                            },
                        },
                    },
                })
            end,

            -- NOTE: This doesn't work properly!
            -- vue
            ['volar'] = function()
                lspconfig['volar'].setup({
                    capabilities = capabilities,
                    cmd = { 'vue-language-server', '--stdio' },
                    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                    init_options = {
                        typescript = {
                            tsdk = vim.fn.stdpath('data')
                                .. '/mason/packages/typescript-language-server/node_modules/typescript/lib',
                        },
                    },
                })
            end,

            -- c/cpp
            ['clangd'] = function()
                lspconfig['clangd'].setup({
                    capabilities = capabilities,
                    cmd = {
                        'clangd',
                        '--offset-encoding=utf-16',
                        '--fallback-style=webkit',
                    },
                })
            end,

            -- haskell
            ['hls'] = function()
                lspconfig['hls'].setup({
                    capabilities = capabilities,
                    settings = {
                        haskell = {
                            formattingProvider = 'fourmolu',
                        },
                    },
                })
            end,
        })
    end,
}
