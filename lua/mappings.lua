require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- codecompanion
map("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
map("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
map("n", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
map("v", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
map("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd [[cab cc CodeCompanion]]
vim.cmd [[cab ccc CodeCompanionChat]]
-- resizing windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- terminal mappings
map("t", "jk", "<C-x>")

-- toggle autoformat
map("n", "<leader>uf", "FormatDisable!")
map("n", "<leader>ue", "FormatEnable")
