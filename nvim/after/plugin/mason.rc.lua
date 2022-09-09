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
	ensure_installed = { "sumneko_lua", "pyright", "rust_analyzer" },
})
