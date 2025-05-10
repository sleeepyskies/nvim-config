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

        mason_lspconfig.setup({
            ensure_installed = {
                -- general LSPs
                'pyright',       -- python
                'lua_ls',        -- lua
                'rust_analyzer', -- rust
                'harper_ls',     -- harper, a grammar lsp
                'bashls',        -- bash
                'sqls'           -- sql

                -- various filetypes
                'jsonls',   --json
                'yamlls',   -- yaml
                'taplo',    -- toml
                'lemminx',  -- xml
                'dockerls', -- docker
                'marksman', -- markdown

                -- c world LSPs
                'clangd',    -- c/c++
                'omnisharp', -- c#
                'cmake',     -- cmake
                'glslls',    -- glsl/hsl

                -- webdev LSPs
                'html',        -- html
                'cssls',       -- css
                'tailwindcss', -- tailwind
                'ts_ls',       -- typescript
                'volar',       -- vue

                -- java world LSPs
                'kotlin_language_server', -- kotlin
                'jdtls',                  -- java

                -- functional language LSPs
                'hls',     -- haskell
                'ocamlls', -- ocaml
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                'prettier',
                'clang-format',
                'cmake_format',
                'lua-format',
                'clangtidy',
                'pylint',
            }
        })
    end,
}
