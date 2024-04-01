return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
	},
	config = function()
		local ts = require("nvim-treesitter.configs")
		ts.setup({
			highlight = {
				enable = true,
				disable = {},
			},
			ensure_installed = {
				"lua",
				"python",
				"rust",
				"go",
				"json",
				"yaml",
				"vim",
				"vimdoc",
				"css",
				"html",
				"solidity",
				"typescript",
				"javascript",
			},
			autotag = {
				enable = true,
			},
		})
	end,
}
