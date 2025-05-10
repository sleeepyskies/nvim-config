-- Allows linting of files
return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local conform = require('conform')

        conform.setup({
            formatters_by_ft = {
                -- general formatters
                lua = { 'stylua' },
                python = { 'black' },
                rust = { 'rustfmt ' },
                bash = { 'shfmt' },
                sql = { 'sqlfmt' },

                -- various filetypes
                json = { 'prettier' },
                yaml = { 'prettier' },
                markdown = { 'prettier' },

                -- c world formatters
                cpp = { 'clang-format' },
                c = { 'clang-format' },
                c_sharp = { 'csharpier' },
                cmake = { 'cmakelang' },

                -- webdev formatters
                html = { 'prettier' },
                css = { 'prettier' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                vue = { 'prettier' },

                -- java world formatters
                java = { 'google-java-format' },
                kotlin = { 'ktlint' },

                -- functional language formatters
                haskell = { 'ormolu' },
                ocaml = { 'ocamlformat' },
            },

            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })

        vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = 'Format file or range (in visual mode)' })
    end,
}
