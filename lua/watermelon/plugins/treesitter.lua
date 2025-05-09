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
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            ensure_installed = {
                'json',
                'tsx',
                'yaml',
                'prisma',
                'markdown',
                'markdown_inline',
                'bash',
                'lua',
                'vim',
                'dockerfile',
                'gitignore',
                'vimdoc',

                'c',
                'cpp',
                'c_sharp',

                'haskell',
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
