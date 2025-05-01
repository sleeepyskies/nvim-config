-- This file is used for setting up lazy plugin manager

-- install lazy plugin manager if not already installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- include path to plugins
require('lazy').setup({ { import = 'watermelon.plugins' }, { import = 'watermelon.plugins.lsp' } }, {
    change_detection = {
        notify = false,
    },
    checker = {
        enabled = true,
        notify = false,
    },
})
