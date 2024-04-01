return {
	"SirVer/ultisnips",
	config = function()
		vim.g.UltiSnipsSnippetDirectories = { vim.env.HOME .. "/.vim/UltiSnips/", "UltiSnips" }
		vim.g.UltiSnipsEditSplit = "horizontal"
	end,
}
