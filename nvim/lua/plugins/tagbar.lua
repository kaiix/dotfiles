return {
	"majutsushi/tagbar", -- require ctags
	config = function()
		vim.keymap.set("n", "<leader>tt", ":TagbarToggle<cr>", { noremap = true, silent = true })

		vim.g.tagbar_type_solidity = {
			ctagstype = "solidity",
			kinds = {
				"c:contracts",
				"e:events",
				"f:functions",
				"m:mappings",
				"v:variables",
			},
		}
	end,
}
