-- Auto-session allows saving of nvim sessions between terminal lifetimes.
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

return {
    'rmagatti/auto-session',
    config = function()
        local autoSession = require('auto-session')

        autoSession.setup({
            auto_restore = false,
            suppressed_dirs = { '~/', '~/dev/', '~/Downloads', '~/Documents', '~/Desktop/' }
        })

        local keymap = vim.keymap

        keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Restore session for the cwd' })
        keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = 'Save currrent session for session root dir' })
    end
}
