local ok, nvim_lsp = pcall(require, "lspconfig")
if not ok then
	return
end

local util = require("lspconfig/util")
local path = util.path

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap(
		"n",
		"<leader>fi",
		[[<cmd>lua vim.lsp.buf.code_action({context={only={"source.organizeImports"}}, apply=true})<CR>]],
		opts
	)

	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint(bufnr, true)
	end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.codeAction = {
	dynamicRegistration = false,
	codeActionLiteralSupport = {
		codeActionKind = {
			valueSet = {
				"source.organizeImports",
			},
		},
	},
}

nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

local get_python_path = function(workspace)
	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	-- Find and use virtualenv in workspace directory.
	for _, pattern in ipairs({ "*", ".*" }) do
		local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
		if match ~= "" then
			return path.join(path.dirname(match), "bin", "python")
		end
	end

	-- Fallback to system Python.
	return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

nvim_lsp.pyright.setup({
	before_init = function(_, config)
		config.settings.python.pythonPath = get_python_path(config.root_dir)
	end,
	on_attach = on_attach,
	flags = { debounce_text_changes = 150 },
	capabilities = capabilities,
})

nvim_lsp.ruff_lsp.setup({
	before_init = function(_, config)
		config.settings.python.pythonPath = get_python_path(config.root_dir)
	end,
	on_attach = on_attach,
	flags = { debounce_text_changes = 150 },
	capabilities = capabilities,
})

-- https://www.npmjs.com/package/@ignored/solidity-language-server
nvim_lsp.solidity.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
	end,
	capabilities = capabilities,
	cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
	filetypes = { "solidity" },
	root_dir = util.root_pattern("hardhat.config.*", ".git"),
	single_file_support = true,
})

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

local function disable_formatting(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

nvim_lsp.tsserver.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- disable_formatting(client) -- use prettier
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<leader>fi",
			[[<cmd>TypescriptOrganizeImports<CR>]],
			{ noremap = true, silent = true }
		)
	end,
	capabilities = capabilities,
	commands = {
		TypescriptOrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

nvim_lsp.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

nvim_lsp.taplo.setup({ on_attach = on_attach, capabilities = capabilities })
nvim_lsp.typos_lsp.setup({})
