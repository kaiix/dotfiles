local ok, ts = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

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
		"css",
		"html",
	},
	autotag = {
		enable = true,
	},
})
