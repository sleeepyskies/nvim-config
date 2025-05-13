return {
    'Civitasv/cmake-tools.nvim',
    ft = { 'c', 'cpp', 'cmake' },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {},
    config = function()
        local cmake_tools = require('cmake-tools')
        cmake_tools.setup({
            cmake_command = 'cmake',
            ctest_command = 'ctest',
            cmake_build_directory = 'build',
            cmake_build_type = 'Debug',
            cmake_generate_options = {},
            cmake_build_options = {},
            cmake_console_size = 10,
            cmake_show_console = 'always',
        })

        vim.keymap.set('n', '<leader>cg', ':CMakeGenerate<CR>', { desc = 'CMake Generate' })
        vim.keymap.set('n', '<leader>cb', ':CMakeBuild<CR>', { desc = 'CMake Build' })
        vim.keymap.set('n', '<leader>cr', ':CMakeRun<CR>', { desc = 'CMake Run' })

        -- apply patch for broken thang
        local scratch = require('cmake-tools.scratch')
        local orig_create = scratch.create
        scratch.create = function(executor, runner)
            if scratch.buffer ~= nil then
                return
            end

            scratch.buffer = vim.api.nvim_create_buf(true, true)
            -- Avoid E95 by checking if a buffer with that name already exists
            local ok = pcall(vim.api.nvim_buf_set_name, scratch.buffer, scratch.name)
            if not ok then
                vim.api.nvim_buf_set_name(scratch.buffer, '*cmake-tools*' .. tostring(scratch.buffer))
            end

            vim.api.nvim_buf_set_lines(scratch.buffer, 0, 0, false, {
                'this is a scratch buffer for cmake-tools.nvim, you can see which command this plugin executes here.',
                'executor: ' .. executor .. ' runner: ' .. runner,
            })
            vim.api.nvim_buf_set_option(scratch.buffer, 'buflisted', false)
        end
    end,
}
