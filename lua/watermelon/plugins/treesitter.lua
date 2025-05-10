-- Creates a syntax tree anf provies syntax highlighting.
return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
        'windwp/nvim-ts-autotag',
    },
    config = function()
        local treesitter = require('nvim-treesitter.configs')

        treesitter.setup({
            ensure_installed = {
                -- general parsers
                'python',
                'lua',
                'rust',
                'bash',
                'sql',
                'vim',

                -- various filetypes
                'json',
                'yaml',
                'toml',
                'xml',
                'dockerfile',
                'gitignore',
                'vimdoc',
                'markdown',
                'markdown_inline',

                -- c world parsers
                'c',
                'cpp',
                'c_sharp',
                'cmake',
                'glsl',

                -- webdev parsers
                'html',
                'css',
                'javascript',
                'typescript',
                'vue',

                -- java world parsers
                'java',
                'kotlin',

                -- functional language parsers
                'haskell',
                'ocaml',
            },
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            modules = {},
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-space>',
                    node_incremental = '<C-space>',
                    scope_incremental = false,
                    node_decremental = '<bs>',
                },
            },
        })
    end,
}
