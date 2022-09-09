vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDDefaultAlign = "left"
vim.g.NERDCompactSexyComs = 1
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDSpaceDelims = 1
vim.keymap.set({ "n", "v" }, "<leader><space>", "<plug>NERDCommenterToggle<CR>", { noremap = true, silent = true })
