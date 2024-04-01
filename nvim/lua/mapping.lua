local keymap = vim.keymap

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Moving
vim.keymap.set("", "<leader>hs", ":split<cr>", { noremap = true, silent = true })
vim.keymap.set("", "<leader>vs", ":vsplit<cr>", { noremap = true, silent = true })
vim.keymap.set("", "<leader>vv", "<C-w>=", { noremap = true, silent = true })

vim.keymap.set("", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("", "<C-l>", "<C-w>l", { noremap = true })

vim.keymap.set("", "<leader>tn", ":tabnew<cr>", { noremap = true })
vim.keymap.set("", "<leader>to", ":tabonly<cr>", { noremap = true })
vim.keymap.set("", "<leader>tc", ":tabclose<cr>", { noremap = true })
vim.keymap.set("", "<leader>tm", ":tabmove<Space>", { noremap = true })
-- Opens a new tab with the current buffer's path
-- Super useful when editing files in the same directory
vim.keymap.set("", "<leader>te", ':tabedit <c-r>=expand("%:p:h")<cr>/', { noremap = true })

-- Switch to the directory of the open buffer
vim.keymap.set("", "<leader>cd", ":cd %:p:h<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<Space>", "}zz", { noremap = true })
vim.keymap.set("v", "<Space>", "}", { noremap = true })

vim.keymap.set("n", "g0", ":tabfirst<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "g$", ":tablast<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "[<C-i>", { noremap = true })

-- Cope
vim.keymap.set("", "<leader>cc", ":botright cope<cr>", { noremap = true, silent = true })
vim.keymap.set("", "<leader>cn", ":cn<cr>", { noremap = true, silent = true })
vim.keymap.set("", "<leader>cp", ":cp<cr>", { noremap = true, silent = true })
vim.keymap.set("", "<leader>ll", ":lopen<cr>", { noremap = true, silent = true })
vim.keymap.set("", "<leader>ln", ":lnext<cr>", { noremap = true, silent = true })
vim.keymap.set("", "<leader>lp", ":lprev<cr>", { noremap = true, silent = true })

-- Paste
vim.keymap.set("", "<leader>pp", ":setlocal paste!<cr>", { noremap = true, silent = true })

-- Source
vim.keymap.set("n", "<leader>so", ":source %<cr>", { noremap = true })
vim.keymap.set("n", "<leader>sz", ":source ~/.config/nvim/init.lua<cr>", { noremap = true })

-- Formatting
-- vim.keymap.set("n", "<leader>ff", function()
--     vim.lsp.buf.format()
-- end, { noremap = true, silent = true })

vim.cmd([[au FileType python inoremap <buffer> $m if __name__ == '__main__':<cr>]])
vim.cmd([[au FileType python inoremap <buffer> $_ def __init__(self, ]])
vim.cmd([[au FileType python inoremap <buffer> $i import]])

-- vim.cmd([[autocmd FileType python map <leader>fi :Autoflake --remove-all-unused-imports<cr>]])

-- Diagnose
vim.keymap.set("n", "gl", [[<cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>]])

-- Text
vim.cmd([[command! -nargs=* Wrap set wrap linebreak nolist]])
