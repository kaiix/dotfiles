local ok, neogit = pcall(require, "neogit")

if not ok then
	return
end

neogit.setup({})

-- vim.keymap.set("n", "<leader>gs", ":Neogit<CR>", { silent = true })
