local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.prettier.with({
			extra_filetypes = { "toml", "solidity" },
		}),
		null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.isort,
		-- null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.solhint,
		-- require("none-ls.formatting.ruff_format"),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			if client.name == "null-ls" then
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"<leader>ff",
					"<cmd>lua vim.lsp.buf.format({async = true})<CR>",
					{ noremap = true, silent = true }
				)
			end
		end
	end,
})
