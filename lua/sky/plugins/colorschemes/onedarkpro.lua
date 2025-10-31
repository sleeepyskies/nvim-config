return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup({
      styles = {
        comments = "italic",
        keywords = "italic",
      },
      options = {
        -- transparency = true,
        cursorline = true,
      },
    })
    -- vim.cmd("colorscheme onedark_dark")
    vim.cmd("colorscheme vaporwave")
  end,
}
