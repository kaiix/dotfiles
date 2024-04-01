return {
	"MunifTanjim/prettier.nvim",
	config = function()
		local prettier = require("prettier")
		prettier.setup({
			filetypes = {
				"css",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"json",
				"jsonc",
				"scss",
				"less",
				"solidity",
				"yaml",
			},
		})
	end,
}
