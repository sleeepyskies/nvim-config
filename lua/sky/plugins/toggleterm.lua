return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float", -- or "horizontal"/"vertical"
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 3,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Optional keymap for normal mode toggle
		vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
	end,
}
