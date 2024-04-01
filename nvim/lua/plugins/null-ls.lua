return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim", { dir = "~/code/neovim/plugins/none-ls-autoflake" } },
	config = function()
		local null_ls = require("null-ls")
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
				require("none-ls-autoflake.formatting"),
			},
		})
	end,
}
