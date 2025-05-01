-- define leader key to be space
vim.g.mapleader = " "

local keymap = vim.keymap -- for simplicity

--------------- LEADER KEYMAPS -----------------
-- search
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlighted search terms." })

-- newline inserts
keymap.set("n", "<leader>o", "o<CR>", { desc = "Inserts two new lines below." })
keymap.set("n", "<leader>O", "O<CR>", { desc = "Inserts two new lines above." })

-- move lines down and up
keymap.set("n", "<leader>sb", "<C-w>v", { desc = "Split window horizontally." })
keymap.set("n", "<Leader>k", ":m .-2:<CR>==", { desc = "Moves the current line up." })

-- window splits
keymap.set("n", "<leader>sv", "<C-w>s", { desc = "Split window vertically." }) 
keymap.set("n", "<Leader>j", ":m .+1<CR>==", { desc = "Moves the current line down." })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size." }) 
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split." })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Opens a new tab." })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Closes the current tab." })
keymap.set("n", "<C-]>", "<cmd>tabn<CR>", { desc = "Cycles to the next tab." })
keymap.set("n", "<C-[>", "<cmd>tabp<CR>", { desc = "Cycles to the previous tab." })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Opens the current buffer in a new tab." })

