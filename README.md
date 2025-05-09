## Overview
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

### [ascii.nvim](https://github.com/MaximilianLloyd/ascii.nvim)
I use this plugin with `alpha.nvim`. It simply provides some ascii-art to use
for the start screen provided by alpha.

## [auto-session.nvim](https://github.com/rmagatti/auto-session)

## Configured LSPs, Formatters, and Linters
### LSPs

### Formatters

### Linters

