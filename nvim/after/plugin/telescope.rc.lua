local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

local actions = require("telescope.actions")

vim.keymap.set("n", "<leader>fp", ":Telescope find_files<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { noremap = true })
vim.keymap.set("n", "<leader>a", ":Telescope live_grep<cr>", { noremap = true })

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
})

telescope.load_extension("live_grep_args")
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>a", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.cmd([[autocmd FileType qf nnoremap <buffer> t <c-w><cr><c-w>T]])
