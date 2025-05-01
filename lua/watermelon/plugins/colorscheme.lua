-- this file sets up the color scheme. Note that schemes can be switched by 
-- uncommenting them, and commenting out the previous scheme

-- tokyo night color scheme
--[[
return {
    "tiagovla/tokyodark.nvim",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme tokyodark")
    end
}
--]]

-- material deep ocean theme
return {
    "marko-cerovac/material.nvim",
    priority = 1000,
    config = function()
        vim.g.material_style = "deep ocean"

        require('material').setup({
            styles = { 
                comments = { italic = true },
                strings = { bold = true },
                keywords = { underline = true },
                functions = { bold = true, undercurl = true },
                variables = {},
                operators = {},
                types = {},
            },

       plugins = { -- Uncomment the plugins that you use to highlight them
                    -- Available plugins:
                    -- "coc",
                    -- "colorful-winsep",
                    -- "dap",
                    "dashboard",
                    -- "eyeliner",
                    -- "fidget",
                    -- "flash",
                    -- "gitsigns",
                    -- "harpoon",
                    -- "hop",
                    -- "illuminate",
                    "indent-blankline",
                    -- "lspsaga",
                    -- "mini",
                    -- "neogit",
                    -- "neotest",
                    -- "neo-tree",
                    -- "neorg",
                    -- "noice",
                    "nvim-cmp",
                    -- "nvim-navic",
                    "nvim-tree",
                    "nvim-web-devicons",
                    -- "rainbow-delimiters",
                    -- "sneak",
                    "telescope",
                    -- "trouble",
                    "which-key",
                    -- "nvim-notify",
                },
        })

        vim.cmd("colorscheme material")
    end
}

