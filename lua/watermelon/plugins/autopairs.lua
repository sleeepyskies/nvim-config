-- Creates closing character for any paired characters.
return {
    'windwp/nvim-autopairs',
    event = { 'InsertEnter' },
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    config = function()
        local autopairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')

        autopairs.setup({
            check_ts = true,
            ts_config = {
                lua = { 'string' },
                javascript = { 'template_string' },
                c = { 'string', 'comment' },
                cpp = { 'string', 'comment' },
            },
        })

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
}
