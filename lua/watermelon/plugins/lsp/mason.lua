---@diagnostic disable: missing-fields
-- Handles installing LSPs, formatters, and linters.
return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local mason_tool_installer = require('mason-tool-installer')

        mason.setup({
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        })

        -- add any LSPs here
        mason_lspconfig.setup({
            ensure_installed = {
                -- general LSPs
                'pyright', -- python
                'lua_ls', -- lua
                'rust_analyzer', -- rust
                'harper_ls', -- harper, a grammar lsp
                'bashls', -- bash
                'sqls', -- sql

                -- various filetypes
                'jsonls', --json
                'yamlls', -- yaml
                'taplo', -- toml
                'lemminx', -- xml
                'dockerls', -- docker
                'marksman', -- markdown

                -- c world LSPs
                'clangd', -- c/c++
                -- 'omnisharp_mono',
                'cmake', -- cmake

                -- webdev LSPs
                'html', -- html
                'cssls', -- css
                'tailwindcss', -- tailwind
                'ts_ls', -- typescript
                'volar', -- vue
                'emmet_ls', -- emmet

                -- java world LSPs
                'kotlin_language_server', -- kotlin
                'jdtls', -- java

                -- functional language LSPs
                'hls', -- haskell
                'ocamllsp',
            },
        })

        -- see mason.lua for what all formatters are used for
        mason_tool_installer.setup({
            ensure_installed = {
                -- formatters
                -- general formatters
                'selene',
                'black',
                'shfmt',
                'sqlfmt',

                -- various filetypes
                'prettier',

                -- c world formatters
                -- 'clang-format',
                'csharpier',
                'cmakelang',

                -- java world formatters
                'google-java-format',
                'ktlint',

                -- functional language formatters
                -- 'fourmolu',
                'ocamlformat',

                -- linters
                -- general linters
                'luacheck',
                'pylint',
                'snyk',
                'shellcheck',
                'sqlfluff',

                -- various filetypes
                'semgrep',
                'yamllint',
                'markdownlint',

                -- c world linters
                -- 'cpplint',
                'htmlhint',
                'stylelint',
                'eslint_d',

                -- java world linters
                'checkstyle',

                -- functional language linters
                -- 'hlint',
            },
        })
    end,
}
