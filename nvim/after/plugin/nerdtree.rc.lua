vim.keymap.set("", "<leader>nn", ":NERDTreeToggle<cr>")
vim.keymap.set("", "<leader>nb", ":NERDTreeFromBookmark<cr>")
vim.keymap.set("", "<leader>nf", ":NERDTreeFind<cr>")

vim.g.NERDTreeIgnore = { "\\.pyc$" }
vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 35
vim.g.NERDTreeShowBookmarks = 1
