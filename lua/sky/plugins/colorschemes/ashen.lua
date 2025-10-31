return {
  "Yazeed1s/oh-lucy.nvim",
  priority = 1000,
  config = function()
    -- need to set config before loading the scheme
    vim.g.oh_lucy_italic_comments = true
    vim.g.oh_lucy_italic_keywords = true
    vim.g.oh_lucy_italic_functions = true

    vim.cmd([[colorscheme oh-lucy-evening]])
  end,
}
