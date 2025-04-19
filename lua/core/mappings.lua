local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal mode
map("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
vim.keymap.set("n", "<leader>p", "<cmd>Telescope projects<CR>", { desc = "Open Projects" })
