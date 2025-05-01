return {
    'rmagatti/auto-session',
    config = function()
        local autoSession = require('auto-session')

        autoSession.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
        })

        local keymap = vim.keymap

        keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Restore session for the cwd' })
        keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = 'Save currrent session for session root dir' })
    end
}
