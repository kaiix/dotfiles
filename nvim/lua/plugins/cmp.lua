return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"quangnguyen30192/cmp-nvim-ultisnips",
		"folke/lua-dev.nvim",
	},
	config = function()
		local cmp = require("cmp")
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_assume_mapped = true
		vim.g.copilot_tab_fallback = ""

		local function replace_termcodes(str)
			return vim.api.nvim_replace_termcodes(str, true, true, true)
		end
		local function check_backspace()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
		end
		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		local tab_complete = function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_next_item()
				-- elseif luasnip.expand_or_jumpable() then
				--     vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-expand-or-jump"), "")
			elseif check_backspace() then
				vim.fn.feedkeys(replace_termcodes("<Tab>"), "n")
			else
				fallback()
			end
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				end,
			},
			preselect = cmp.PreselectMode.None,
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					-- behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				["<Tab>"] = vim.schedule_wrap(tab_complete),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "copilot" },
				{ name = "ultisnips" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
		})

		vim.opt.completeopt = "menuone,noinsert,noselect"
		vim.cmd([[
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
	end,
}
