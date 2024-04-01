return {
	"svrana/neosolarized.nvim",
	dependencies = {
		"tjdevries/colorbuddy.nvim",
		"rktjmp/lush.nvim",
	},
	priority = 1000,
	lazy = false,
	config = function()
		local solarized = require("neosolarized")
		solarized.setup({ comment_italics = true })
	end,
}
