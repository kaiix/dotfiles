vim.g.fugitive_pty = 0
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { silent = true })
vim.keymap.set("n", "<leader>gd", ":Gdiff<CR>", { silent = true })
vim.keymap.set("n", "<leader>gc", ":Gcommit<CR>", { silent = true })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { silent = true })
vim.keymap.set("n", "<leader>gl", ':call TermOpen("tig")<CR>', { silent = true })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { silent = true })
vim.keymap.set("n", "<leader>gi", ":Git add -p %<CR>", { silent = true })
