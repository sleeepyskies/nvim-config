return {
  "nwiizo/cargo.nvim",
  build = "cargo build --release",
  ft = { "rust" },
  cmd = {
    "CargoBench",
    "CargoBuild",
    "CargoClean",
    "CargoDoc",
    "CargoNew",
    "CargoRun",
    "CargoRunTerm",
    "CargoTest",
    "CargoUpdate",
    "CargoCheck",
    "CargoClippy",
    "CargoAdd",
    "CargoRemove",
    "CargoFmt",
    "CargoFix",
  },
  config = function()
    require("cargo").setup({
      float_window = true,
      window_width = 0.8,
      window_height = 0.8,
      border = "rounded",
      auto_close = true,
      close_timeout = 5000,
    })

    -- Keymaps
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true, desc = "" }

    map(
      "n",
      "<leader>rr",
      "<cmd>CargoRun<cr>",
      vim.tbl_extend("force", opts, { desc = "Cargo Run" })
    )
    map(
      "n",
      "<leader>rb",
      "<cmd>CargoBuild<cr>",
      vim.tbl_extend("force", opts, { desc = "Cargo Build" })
    )
    map(
      "n",
      "<leader>rt",
      "<cmd>CargoTest<cr>",
      vim.tbl_extend("force", opts, { desc = "Cargo Test" })
    )
    map(
      "n",
      "<leader>rc",
      "<cmd>CargoCheck<cr>",
      vim.tbl_extend("force", opts, { desc = "Cargo Check" })
    )
    map(
      "n",
      "<leader>rf",
      "<cmd>CargoFmt<cr>",
      vim.tbl_extend("force", opts, { desc = "Cargo Fmt" })
    )
    map(
      "n",
      "<leader>rl",
      "<cmd>CargoClippy<cr>",
      vim.tbl_extend("force", opts, { desc = "Cargo Clippy" })
    )
  end,
}
