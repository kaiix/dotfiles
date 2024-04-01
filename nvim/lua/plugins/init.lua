return {
	{ "projekt0n/github-nvim-theme" },
	{ "lewis6991/impatient.nvim" },
	{ "fabi1cazenave/termopen.vim" },
	{ "ray-x/go.nvim" },
	{ "mg979/vim-visual-multi" },
	{ "plasticboy/vim-markdown" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "tenfyzhong/autoflake.vim" },
	{ "psf/black" },
	{ "aklt/plantuml-syntax" },
	{ "avakhov/vim-yaml" },
	{ "tweekmonster/braceless.vim" },
	{ "Vimjas/vim-python-pep8-indent" },
	{ "tpope/vim-rhubarb" },
	{ "hashivim/vim-terraform" },
	{ "udalov/kotlin-vim" },
	{ "pearofducks/ansible-vim" },
	{ "nathangrigg/vim-beancount" },
	{ "jmcantrell/vim-virtualenv" },

	{ "tomlion/vim-solidity" },
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				signs = false,
			})
		end,
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
	}
}

