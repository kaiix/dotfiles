vim.keymap.set("", "<leader>nf", function()
    if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
        vim.cmd("NERDTreeToggle")
    else
        vim.cmd("NERDTreeFind")
    end
end)

vim.g.NERDTreeIgnore = { "\\.pyc$" }
vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 35
vim.g.NERDTreeShowBookmarks = 1
