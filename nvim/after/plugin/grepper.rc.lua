vim.g.grepper = {
	tools = { "rg" },
	simple_prompt = 1,
	quickfix = 0,
	rg = { grepprg = "rg --vimgrep --smart-case --no-ignore -g '!{.git,.svn,.hg}'" },
}

-- vim.keymap.set("n", "<Leader>a", ":Grepper -tool rg<cr> ", { noremap = false })
-- vim.cmd([[autocmd FileType qf nnoremap <buffer> t <c-w><cr><c-w>T]])
