return {
  "marko-cerovac/material.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- set options before loading colorscheme
    require("material").setup({
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        types = { bold = true },
      },
      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "blink",
        -- "coc",
        -- "colorful-winsep",
        -- "dap",
        -- "dashboard",
        -- "eyeliner",
        -- "fidget",
        -- "flash",
        "gitsigns",
        -- "harpoon",
        -- "hop",
        -- "illuminate",
        -- "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neo-tree",
        -- "neogit",
        -- "neorg",
        -- "neotest",
        -- "noice",
        "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-notify",
        -- "nvim-tree",
        "nvim-web-devicons",
        -- "rainbow-delimiters",
        -- "sneak",
        "telescope",
        "trouble",
        "which-key",
      },
      lualine_style = "default",
      async_loading = true,
      high_visibility = {
        lighter = false,
        darker = true,
      },
    })
    vim.g.material_style = "deep ocean"
    vim.cmd([[colorscheme material]])
  end,
}
