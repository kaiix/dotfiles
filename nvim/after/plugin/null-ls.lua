local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"solidity",
				"typescript",
				"javascript",
                "toml",
                "yaml",
			},
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.solhint,
	},
})
