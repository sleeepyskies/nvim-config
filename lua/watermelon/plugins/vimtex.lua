return {
    'lervag/vimtex',
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = 'general'
        vim.g.vimtex_view_general_viewer = 'zathura'
    end,
}
