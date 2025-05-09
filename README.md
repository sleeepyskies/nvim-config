# Overview
This repo holds my nvim config. I will list each plugin (soon), as well as what
purpose they serve and how I have configure them. This is mainly for my own 
help. Furthermore, any things I want to change about my config but am too lazy 
to do will be added here.

My config is based on [this blog](https://www.josean.com/posts/how-to-setup-neovim-2024).

## TODO
- Fix all the errors
- Configure all lsps I need, as well as figure out which ones I need
- Set up formatting
- Go through all plugins and configure how I need them. Remove/add any stuff I
want/don't need anymore
- get italics/cursive to work within tmux/iterm2. Or just use another terminal idk.


## Config Structure
```
.
├── init.lua
├── lazy-lock.json
├── /lua
│   └── /watermelon
│       ├── /core
│       ├── lazy.lua
│       └── /plugins
│           ├── /lsp
└── README.md
```
The entry point of my nvim config is `init.lua` at the config root. It loads the
core and lazy modules. Under `lua/watermelon`, you can find:
1. `core`
    - This holds any core vim settings, such as personal option settings for
    vim and custom vim keymaps.
2. `plugins`
    - This holds all plugin related `.lua` files. Each plugin has it's own file
    returning its own table.
3. `lsp`
    - This holds plugins for getting and configuring LSPs.

## Core
The entry point of the core module is `init.lua`, which requires the `options` 
and `keymaps` files. `options` handles setting up specific native vim settings.
`keymaps` handles, as the name suggests, any core vim keybindings. Plugin specific
keybindings can be found in their respective `.lua` file.

## Plugins
`lazy.lua` is the entry point for loading plugins. This file will install 
[lazy.nvim](https://github.com/folke/lazy.nvim) if it is not already installed. 
This is the plugin manager I use. It maintains `lazy-lock.json` at the root for
keeping track of any plugins and their dependencies. `lazy.lua` will then load
any plugins found under `/plugins` and `/plugins/lsp`.

### init.lua

This file found under `/plugins` sets up two plugins:
#### [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
This plugin is used by many other plugins as a utility plugin, with useful methods.

#### [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
This plugin works in combination with tmux to allow transitioning between nvim
tmux splits. The following keymaps are setup:
1. `<CTRL>vim-movement-keys`
    - This enables navigation between nvim and tmux panes.

### [alpha.nvim](https://github.com/goolord/alpha-nvim)
This plugin creates a greeting start screen when opening nvim up. It can be 
customized both visually and functionally, allowing me to add custom commands to
run with shortcuts.

It is loaded on `VimEnter`.

### [ascii.nvim](https://github.com/MaximilianLloyd/ascii.nvim)
I use this plugin with `alpha.nvim`. It simply provides some ascii-art to use
for the start screen provided by alpha.

### [auto-session.nvim](https://github.com/rmagatti/auto-session)
This plugin makes it possible to save and load nvim sessions. 

#### Keymaps
- `<leader>ws`
    - saves the current workspace
- `<leader>ws`
    - loads the saved workspace

### [nvim-autopairs.nvim](https://github.com/windwp/nvim-autopairs?tab=readme-ov-file)
This plugin handles inserting closing pair characters for any opening pair
characters. A custom rule has been added to also close `<>` pairs.

### [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
This plugin creates traversable tabs for each buffer open. It has been configured
to allow multiple tabs in one buffer.

### colorscheme.lua
This file holds my current theme. ATM, I am using my go-to theme [material.nvim](https://github.com/marko-cerovac/material.nvim).
It has fields for adding any supported plugins to the theme.

### formatting.lua
For formatting, I am using [conform.nvim](https://github.com/stevearc/conform.nvim).
Formatters must be also installed at `plugins/lsp/mason.lua` and configured at
`plugins/lsp/lspconfig.lua`.

#### Keymaps
1. `<leader>mp`
    - Formats the current file/selection.

### [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
This plugin is used to add git integration to nvim. It provides colored highlights
at the side of a file to indicate the hunks git status, as well as some nice 
keymaps.

### Keymaps
1. `]h`
    - Move to the next hunk
2. `[h`
    - Move to the previous hunk

All following keymaps have the `<leader>` prefix.

3. `gs`
    - Stage hunk
4. `gr`
    - Rollback hunk
5. `gS`
    - Stage buffer
6. `gR`
    - Rollback buffer
7. `gu`
    - Undo stage hunk
8. `gb`
    - Blame this line
9. `gB`
    - Toggle line blame
10. `gd`
    - Diff this buffer

### [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
This plugin adds indent guides to nvim.

### [nvim-lint](https://github.com/mfussenegger/nvim-lint)
This plugin is used to get and configure linters. I have setup following keybinds:
1. `<leader>l`
    - Lints the current buffer.

### [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
This plugin provides a statusline bar for nvim. It provides information on:
- The current git repo status
- The current vim mode
- Any code issues
- Filetype/encoding
- Any outdated plugins

### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
This plugin provides auto complete suggestions for nvim. It provides following
keymaps for navigating suggestions:

All keybindings are prefixed with the `<C>` button.

1. `k` / `j`
    - Navigate suggestions
2. `b` / `f`
    - Scroll through the shown documentation
3. `Space`
    - Opens the autocomplete menu
4. `e`
    - Aborts the menu

### [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
Provides a better file explorer for nvim. It provides following keybindings, all
prefixed with `<leader>e`
1. `e`
    - Opens the file tree
2. `f`
    - Opens the file tree at the current file
3. `c`
    - Collapses the file tree

### [snacks.nvim](https://github.com/folke/snacks.nvim?tab=readme-ov-file#-usage)
This plugin provides some QOL features. Currently, I am only using it as a
replacement for [dressing.nvim](https://github.com/stevearc/dressing.nvim), for
it's `vim.ui.select` and `vim.ui.input` improvements.


## Configured LSPs, Formatters, and Linters
### LSPs

### Formatters

### Linters

