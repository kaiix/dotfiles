-- use telescope instead of ctrlp
-- vim.g.ctrlp_map = "<leader>j"
vim.g.ctrlp_working_path_mode = 0
vim.g.ctrlp_custom_ignore = [[\v[\/](node_modules|venv)|(\.(DS_Store|git|svn))$]]

vim.keymap.set("n", "<leader>y", ":CtrlPClearCache<CR>", { noremap = true })

if vim.fn.executable("ag") then
	-- Use ag over grep
	vim.opt.grepprg = "ag --nogroup --nocolor"
	vim.g.ctrlp_user_command = [[ag %s -l --nocolor -g]]
	-- ag is fast enough that CtrlP doesn't need to cache
	vim.g.ctrlp_use_caching = 0
end

if vim.fn.executable("rg") then
	vim.opt.grepprg = "rg --color=never --no-heading --with-filename --line-number --column"
	vim.g.ctrlp_user_command = [[rg %s --files --color=never --glob ""]]
	vim.g.ctrlp_use_caching = 0
end
