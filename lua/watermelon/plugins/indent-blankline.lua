return {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    main = 'ibl',
    opts = {
        scope = { enabled = true },
        indent = {
            char = '│',
            highlight = { 'IndentBlanklineChar' },
        },
    },
    config = function(_, opts)
        require('ibl').setup(opts)
        vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#3E4452', nocombine = true })
        vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = '#ABB2BF', nocombine = true })
    end,
}
