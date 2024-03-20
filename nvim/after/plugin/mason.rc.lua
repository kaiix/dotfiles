local ok, mason = pcall(require, "mason")
if not ok then
	return
end

local ok, lspconfig = pcall(require, "mason-lspconfig")
if not ok then
	return
end

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
	},
})
