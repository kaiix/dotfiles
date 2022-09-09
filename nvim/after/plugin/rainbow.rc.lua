vim.g.rbpt_max = 16
vim.api.nvim_create_autocmd("Syntax", {
	pattern = { "*" },
	callback = function()
		vim.cmd("silent! RainbowParenthesesLoadRound")
		vim.cmd("silent! RainbowParenthesesLoadSquare")
	end,
})
vim.keymap.set("n", "<leader>bb", ":RainbowParenthesesToggle<cr>")
