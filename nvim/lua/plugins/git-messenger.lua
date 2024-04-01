return {
	"rhysd/git-messenger.vim",
	config = function()
		vim.keymap.set("n", "<leader>gm", ":GitMessenger<CR>", { noremap = true, silent = true })
	end,
}
