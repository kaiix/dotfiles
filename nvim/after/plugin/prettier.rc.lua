local ok, prettier = pcall(require, "prettier")
if not ok then
	return
end

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
