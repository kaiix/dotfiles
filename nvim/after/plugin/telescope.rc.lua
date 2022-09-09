local ok, _ = pcall(require, "telescope")
if not ok then
	return
end

vim.keymap.set("n", "<leader>fj", ":Telescope find_files<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { noremap = true })
