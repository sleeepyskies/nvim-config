-- a toggleable floating terminal overlay
return {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
        local toggleterm = require('toggleterm')
        toggleterm.setup({
            size = function()
                return vim.o.columns * 0.8
            end,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = 'float',
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = 'curved',
                winblend = 0,
                highlights = {
                    border = 'FloatBorder',
                    background = 'NormalFloat',
                },
            },
        })
        local Terminal = require('toggleterm.terminal').Terminal
        local float_term = Terminal:new({ direction = 'float', hidden = true })
        vim.keymap.set({ 'n', 't' }, '<leader>tt', function()
            float_term:toggle()
        end, { noremap = true, silent = true, desc = 'Open a terminal' })

        -- unique terminal for using lazygit
        local lazygit = Terminal:new({
            cmd = 'lazygit',
            direction = 'float',
            hidden = true,
            count = 99, -- ensure it's unique
        })
        vim.keymap.set('n', '<leader>hh', function()
            lazygit:toggle()
        end, { noremap = true, silent = true, desc = 'Open LazyGit' })
    end,
}
