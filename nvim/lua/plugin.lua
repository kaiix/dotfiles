local function install_packer()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	end
end

install_packer()

vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "Packer",
	pattern = "*/lua/*.lua",
	callback = function()
		vim.cmd("source <afile>")
		vim.cmd("PackerCompile")
	end,
})

local ok, packer = pcall(require, "packer")
if not ok then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"svrana/neosolarized.nvim",
		requires = {
			"tjdevries/colorbuddy.nvim",
			"rktjmp/lush.nvim",
		},
	})
	use("folke/tokyonight.nvim")
	use("EdenEast/nightfox.nvim")
	use("lewis6991/impatient.nvim")
	use("fabi1cazenave/termopen.vim")
	use("ray-x/go.nvim")
	use("scrooloose/nerdtree")
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	use("terryma/vim-multiple-cursors")
	use("majutsushi/tagbar") -- require ctags
	use("edkolev/tmuxline.vim")
	use("plasticboy/vim-markdown")
	use("ctrlpvim/ctrlp.vim")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tenfyzhong/autoflake.vim")
	use("joshdick/onedark.vim")
	use("cocopon/iceberg.vim")
	use("psf/black")
	use("Yggdroot/indentLine")
	use("kien/rainbow_parentheses.vim")
	use("rhysd/accelerated-jk")
	use("scrooloose/nerdcommenter")
	use("jlanzarotta/bufexplorer")
	use("aklt/plantuml-syntax")
	use("SirVer/ultisnips")
	use("avakhov/vim-yaml")
	use("tweekmonster/braceless.vim")
	use("Vimjas/vim-python-pep8-indent")
	use("tpope/vim-rhubarb")
	use("hashivim/vim-terraform")
	use("udalov/kotlin-vim")
	use("pearofducks/ansible-vim")
	use("nathangrigg/vim-beancount")
	use("jmcantrell/vim-virtualenv")

	use("tomlion/vim-solidity")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
		},
	})
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"quangnguyen30192/cmp-nvim-ultisnips",
			"folke/lua-dev.nvim",
		},
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
	use("mfussenegger/nvim-dap")
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("tpope/vim-fugitive")
	use("rhysd/git-messenger.vim")
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("neogit").setup()
		end,
	})
	-- use("kyazdani42/nvim-web-devicons") -- alacritty
	use({
		"folke/trouble.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				signs = false,
			})
		end,
	})
	use({
		"numToStr/Navigator.nvim",
	})
	-- https://github.com/neovim/neovim/pull/21633
	-- use("gpanders/editorconfig.nvim")
end)
