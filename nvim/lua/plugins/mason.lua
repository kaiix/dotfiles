return {
	"williamboman/mason.nvim",
	dependencies = "williamboman/mason-lspconfig.nvim",
	config = function()
		local mason = require("mason")
		local lspconfig = require("mason-lspconfig")

		mason.setup({})

		lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"tsserver",
				"yamlls",
				"solidity_ls_nomicfoundation",
				"taplo",
				"typos_lsp",
				"ruff_lsp",
				"bashls",
			},
		})
	end,
}
