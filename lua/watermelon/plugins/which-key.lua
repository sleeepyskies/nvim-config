-- displays available keybindings
return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        -- wait 500ms to activate
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        -- use default config
    }
}
