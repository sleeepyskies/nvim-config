return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {},
    config = function()
        local md = require('render-markdown')

        md.setup({
            completions = { lsp = { enabled = true } },
        })
    end,
}
