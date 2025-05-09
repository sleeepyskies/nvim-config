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

### [snacks.nvim](https://github.com/folke/snacks.nvim?tab=readme-ov-file#-usage)
This plugin provides some QOL features. Currently, I am only using it as a
replacement for [dressing.nvim](https://github.com/stevearc/dressing.nvim), for
it's `vim.ui.select` and `vim.ui.input` improvements.

## Configured LSPs, Formatters, and Linters
### LSPs

### Formatters

### Linters

