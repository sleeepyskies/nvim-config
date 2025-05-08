## Overview
This repo holds my nvim config. I will list each plugin (soon), as well as what
purpose they serve and how I have configure them. This is mainly for my own 
help. Furthermore, any things I want to change about my config but am too lazy 
to do will be added here.

## TODO
- Finish setting up my config :D
- Fix all the errors
- Configure all lsps I need, as well as figure out which ones I need
- Set up formatting
- Go through all plugins and configure how I need them. Remove/add any stuff I
want/don't need anymore

## Config Structure
The entry point of my nvim config is `init.lua` at the config root. It loads the
core and lazy modules. Under `lua/watermelon`, you can find:
1. `core`
    - This holds any core vim settings, such as personal option settings for
    vim and custom vim keymaps.
2. `plugins`
    - This holds all plugin related `.lua` files. Each plugin has it's own file
    returning its own table.

## Core
The entry point of the core module is `init.lua`, which requires the `options` 
and `keymaps` files. `options` handles setting up specific native vim settings.
`keymaps` handles, as the name suggests, any core vim keybindings. Plugin specific
keybinds can be found in their respective `.lua` file.

## Plugins

## Configured LSPs, Formatters and Linters
### LSPs

### Formatters

### Linters

