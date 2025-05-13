-- material deep ocean theme
return {
    'marko-cerovac/material.nvim',
    priority = 1000,
    config = function()
        vim.g.material_style = 'deep ocean'

        require('material').setup({
            styles = {
                comments = { italic = true },
                strings = { bold = true },
                keywords = { italic = true },
                functions = { bold = true },
                variables = {},
                operators = {},
                types = {},
            },
            -- enable transparent background
            disable = {
                background = true,
            },
            plugins = { -- Uncomment the plugins that you use to highlight them
                -- Available plugins:
                -- 'coc',
                -- 'colorful-winsep',
                -- 'dap',
                -- 'dashboard',
                -- 'eyeliner',
                -- 'fidget',
                -- 'flash',
                'gitsigns',
                -- 'harpoon',
                -- 'hop',
                -- 'illuminate',
                'indent-blankline',
                -- 'lspsaga',
                -- 'mini',
                -- 'neogit',
                -- 'neotest',
                -- 'neo-tree',
                -- 'neorg',
                -- 'noice',
                'nvim-cmp',
                -- 'nvim-navic',
                'nvim-tree',
                'nvim-web-devicons',
                -- 'rainbow-delimiters',
                -- 'sneak',
                'telescope',
                -- 'trouble',
                'which-key',
                -- 'nvim-notify',
            },
        })

        vim.cmd('colorscheme material')
    end,
}
