# Overview

<!--toc:start-->

- [Overview](#overview)
  - [TODO](#todo)
  - [Config Structure](#config-structure)
  - [Core](#core)
  - [Plugins](#plugins)
    - [init.lua](#initlua)
      - [[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)](#plenarynvimhttpsgithubcomnvim-luaplenarynvim)
      - [[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)](#vim-tmux-navigatorhttpsgithubcomchristoomeyvim-tmux-navigator)
    - [[alpha.nvim](https://github.com/goolord/alpha-nvim)](#alphanvimhttpsgithubcomgoolordalpha-nvim)
    - [[ascii.nvim](https://github.com/MaximilianLloyd/ascii.nvim)](#asciinvimhttpsgithubcommaximilianlloydasciinvim)
    - [[auto-session.nvim](https://github.com/rmagatti/auto-session)](#auto-sessionnvimhttpsgithubcomrmagattiauto-session)
      - [Keymaps](#keymaps)
    - [[nvim-autopairs.nvim](https://github.com/windwp/nvim-autopairs?tab=readme-ov-file)](#nvim-autopairsnvimhttpsgithubcomwindwpnvim-autopairstabreadme-ov-file)
    - [[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)](#bufferlinenvimhttpsgithubcomakinshobufferlinenvim)
    - [colorscheme.lua](#colorschemelua)
    - [formatting.lua](#formattinglua)
      - [Keymaps](#keymaps)
    - [[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)](#gitsignsnvimhttpsgithubcomlewis6991gitsignsnvim)
    - [Keymaps](#keymaps)
    - [[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)](#indent-blanklinenvimhttpsgithubcomlukas-reinekeindent-blanklinenvim)
    - [[nvim-lint](https://github.com/mfussenegger/nvim-lint)](#nvim-linthttpsgithubcommfusseneggernvim-lint)
    - [[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)](#lualinenvimhttpsgithubcomnvim-lualinelualinenvim)
    - [[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)](#nvim-cmphttpsgithubcomhrsh7thnvim-cmp)
    - [[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)](#nvim-treehttpsgithubcomnvim-treenvim-treelua)
    - [[snacks.nvim](https://github.com/folke/snacks.nvim?tab=readme-ov-file#-usage)](#snacksnvimhttpsgithubcomfolkesnacksnvimtabreadme-ov-file-usage)
    - [[nvim-surround](https://github.com/kylechui/nvim-surround)](#nvim-surroundhttpsgithubcomkylechuinvim-surround)
    - [[nvim-telescope](https://github.com/nvim-telescope/telescope.nvim)](#nvim-telescopehttpsgithubcomnvim-telescopetelescopenvim)
    - [[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)](#todo-commentsnvimhttpsgithubcomfolketodo-commentsnvim)
    - [[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)](#nvim-treesitterhttpsgithubcomnvim-treesitternvim-treesitter)
    - [[trouble.nvim](https://github.com/folke/trouble.nvim)](#troublenvimhttpsgithubcomfolketroublenvim)
    - [[virt-column](https://github.com/lukas-reineke/virt-column.nvim)](#virt-columnhttpsgithubcomlukas-reinekevirt-columnnvim)
    - [[which-key](https://github.com/folke/which-key.nvim)](#which-keyhttpsgithubcomfolkewhich-keynvim)
    - [[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)](#nvim-lspconfighttpsgithubcomneovimnvim-lspconfig)
    - [[mason.nvim](https://github.com/mason-org/mason.nvim)](#masonnvimhttpsgithubcommason-orgmasonnvim)
  - [Configured LSPs, Formatters, and Linters](#configured-lsps-formatters-and-linters) - [LSPs](#lsps) - [Formatters](#formatters) - [Linters](#linters)
  <!--toc:end-->

This repo holds my nvim config. I will list each plugin (soon), as well as what
purpose they serve and how I have configure them. This is mainly for my own
help. Furthermore, any things I want to change about my config but am too lazy
to do will be added here.

My config is based on [this blog](https://www.josean.com/posts/how-to-setup-neovim-2024).

## TODO

- Fix all the errors
- Fix pylint, has been just disabled for now.
- add missing docs here for newly added plugins.

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

### [cmake-tools.nvim](https://github.com/Civitasv/cmake-tools.nvim)

This plugin integrates CMake into nvim. I have setup some keybinds to use useful
provided commands. To see the full list of available commands, go [here](https://github.com/Civitasv/cmake-tools.nvim/blob/master/docs/all_commands.md).
Keybinds:

- `<leader>cg`:
  - Generate CMake configuration.
- `<leader>cb`
  - Build CMake project.
- `<leader>cr`
  - Runs the executable

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

All following keymaps have the `<leader>h` prefix.

3. `s`
   - Stage hunk
4. `r`
   - Rollback hunk
5. `S`
   - Stage buffer
6. `R`
   - Rollback buffer
7. `u`
   - Undo stage hunk
8. `b`
   - Blame this line
9. `B`
   - Toggle line blame
10. `d`
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

### [nvim-surround](https://github.com/kylechui/nvim-surround)

This plugin provides some helpful keybindings/shortcuts for dealing with paired
character. This includes changing these pairs, adding them, deleting them and more.

Taken from the `nvim-surround` git repo:

    Old text                    Command         New text

---

    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls

### [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim)

This plugin is a fuzzy finder for nvim. It essentially allows the user to search
through both file names and file content with the help of grep. I have setup the
follwing keybinds:

All keybindigs are prefixed with `<leader>f`

1. `f`
   - Search filenames
2. `s`
   - Search for strings in the cwd
3. `c`
   - Search for the string under the cursor in the cwd
4. `t`
   - Search for TODO likes

### [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

This plugin provides nice TODO comments with highlighting. Furthermore, these
comments can be searched for using plugins like Telescope. The plugin provides
the following comments:

- TODO:
- HACK:
- WARN:
- PERF:
- NOTE:
- TEST:

### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Treesitter is used to parse code and create a syntax tree. It also provides some
syntax highlighting (so language keywords, strings etc..). Semantic highlighting
(should I think) be covered by LSPs. Furthermore, it has some use keybindings:

1. `<C-space>`
   - Highlights the current scope, as well as increases its range by one.
2. `<bs>`
   - Decrease the selection range.

### [trouble.nvim](https://github.com/folke/trouble.nvim)

This plugin provides a way to check project diagnostics. It has following keybinds
setup, all prefixed with `<leader>x`:

1. `w`
   - Opens workspace diagnostics
2. `d`
   - Opens buffer diagnostics
3. `q`
   - Opens troubles quickfix list
4. `l`
   - Opens troubles location list
5. `t`
   - Opens all TODOs in trouble

### [virt-column](https://github.com/lukas-reineke/virt-column.nvim)

This plugin replaces the default nvim line guards that are a whole character
wide with a thinner one.

### [which-key](https://github.com/folke/which-key.nvim)

This plugin displays all available keybindings.

### [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

This handles configuring and setting up nvim's LSP client with any installed
servers.

### [mason.nvim](https://github.com/mason-org/mason.nvim)

Handles installing LSPs, formatters, and linters.

## Configured LSPs, Formatters, and Linters

The general workflow for setting these up is written here.

### LSPs

A list of available LSPs can be found [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ocamllsp).

Inside `plugins/lsp/mason.lua`, add any LSP names in the `mason_lsp.setup()`
function. If any LSP should have a custom configuration, it can be added under
`plugins/lsp/lspconfig.lua` inside of the `mason_lspconfig.setup_handlers()`
function. Create a new table entry as `[lsp_name]`, and set it to a function
where the custom config goes.

Furthermore, it is probably a good idea to add a new Tree-sitter parser when adding
a new LSP. The available parsers can be found [here](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages).
They should be added in `plugins/treesitter.lua` in the `treesitter.setup()`
function.

### Formatters

Formatting automatically arranges the code to follow certain style guides.

Formatters can be found by using the `:Mason` command inside of nvim, and navigating
to the 5th pane. To setup a new formatter, add it to the `conform.setup()` function.
After this, navigate to `mason.lua` and add the same formatter name to the
`mason_tool_installer.setup()` function.

### Linters

Linting checks the code for errors, potential bugs and coding standard violations.

Linters can be added by navigating to `plugins/linting.lua` and adding them in the
`lint.linters_by_ft` table. Any new linters should then also be added in `mason.lua`
in the `mason_tool_installer.setup()` function.
