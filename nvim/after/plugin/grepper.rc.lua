vim.g.grepper = {
	simple_prompt = 1,
	quickfix = 0,
}

vim.keymap.set("n", "<Leader>a", ":Grepper -tool rg<cr> ", { noremap = false })
