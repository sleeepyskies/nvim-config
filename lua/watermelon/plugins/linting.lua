-- Sets up linting files in nvim
return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            -- general linters
            lua = { 'selene' },
            python = { 'pylint' },
            rust = { 'snyk' },
            bash = { 'shellcheck' },
            sql = { 'sqlfluff' },

            -- various filetypes
            json = { 'semgrep' },
            yaml = { 'yamllint' },
            markdown = { 'markdownlint' },

            -- c world formatters
            c_sharp = { 'semgrep' },

            -- webdev formatters
            html = { 'htmlhint' },
            css = { 'stylelint' },
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },

            -- java world formatters
            java = { 'checkstyle' },
            kotlin = { 'ktlint' },

            -- functional language formatters
        }

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set('n', '<leader>l', function()
            lint.try_lint()
        end, { desc = 'Trigger linting for current file' })
    end,
}
