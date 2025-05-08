-- stylua: ignore
-- This file is used to customise and set options in vim (done using vim.opt.xxx)

-- newtr: use tree style directory listings.
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for simplicity

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indents
opt.tabstop = 4       -- use 4 spaces for tabs
opt.shiftwidth = 4    -- set number of spaces to use for indenting using > in vim
opt.expandtab = true  -- convert tabs to spaces
opt.autoindent = true -- copy previous line indentation when starting a newline

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search
opt.ignorecase = true -- case insensitive searches
opt.smartcase = true  -- using mixed case enforces case sensitivity

-- cursor line
opt.cursorline = true -- highlight line cursor is on

-- line guards
opt.colorcolumn = '80,100,120' -- provide line guards

-- appearance
opt.termguicolors = true -- enable true color in terminal
opt.background = "dark"  -- prefer dark themes
opt.signcolumn = "yes"   -- enable a column that can be used for icons

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard for yanking!

-- splits
opt.splitright = true -- default to vert split to the right
opt.splitbelow = true -- default to horizont split downwards

-- swapfiles
opt.swapfile = false -- disable swapfiles, which are used for crash recovery but can clutter filesystem
