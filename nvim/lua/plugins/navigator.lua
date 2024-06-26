return {
	"numToStr/Navigator.nvim",
	lazy = false,
	config = function()
		local navigator = require("Navigator")
		navigator.setup()

		vim.keymap.set({ "n", "t" }, "<M-h>", "<CMD>NavigatorLeft<CR>")
		vim.keymap.set({ "n", "t" }, "<M-l>", "<CMD>NavigatorRight<CR>")
		vim.keymap.set({ "n", "t" }, "<M-k>", "<CMD>NavigatorUp<CR>")
		vim.keymap.set({ "n", "t" }, "<M-j>", "<CMD>NavigatorDown<CR>")
		vim.keymap.set({ "n", "t" }, "<M-p>", "<CMD>NavigatorPrevious<CR>")
	end,
}
