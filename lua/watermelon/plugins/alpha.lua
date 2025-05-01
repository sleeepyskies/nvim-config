return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        local ascii = require('ascii')

        -- define dashboard header
        dashboard.section.header.val = ascii.get_random('text', 'neovim')

        -- define dashboard menu items 
        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
            dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
            dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
        }
        -- send config to alpha
        alpha.setup(dashboard.opts)

        -- disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}
