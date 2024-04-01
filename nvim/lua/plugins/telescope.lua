return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		vim.keymap.set("n", "<leader>j", ":Telescope find_files<cr>", { noremap = true })
		vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<cr>", { noremap = true })
		vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true })
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { noremap = true })
		vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { noremap = true })
		vim.keymap.set("n", "<leader>a", ":Telescope live_grep<cr>", { noremap = true })

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
				file_ignore_patterns = { "node_modules", ".git" },
				preview = {
					mime_hook = function(filepath, bufnr, opts)
						local is_image = function(filepath)
							local image_extensions = { "png", "jpg" } -- Supported image formats
							local split_path = vim.split(filepath:lower(), ".", { plain = true })
							local extension = split_path[#split_path]
							return vim.tbl_contains(image_extensions, extension)
						end
						if is_image(filepath) then
							local term = vim.api.nvim_open_term(bufnr, {})
							local function send_output(_, data, _)
								for _, d in ipairs(data) do
									vim.api.nvim_chan_send(term, d .. "\r\n")
								end
							end
							vim.fn.jobstart({
								"chafa",
								filepath, -- Terminal image viewer command
							}, { on_stdout = send_output, stdout_buffered = true, pty = true })
						else
							require("telescope.previewers.utils").set_preview_message(
								bufnr,
								opts.winid,
								"Binary cannot be previewed"
							)
						end
					end,
				},
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
				},
				-- media_files = {
				--     filetypes = { "png", "webp", "jpg", "jpeg" },
				--     find_cmd = "rg",
				-- },
			},
			pickers = {
				buffers = {},
				find_files = {
					hidden = true,
				},
				oldfiles = {
					hidden = true,
				},
			},
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("live_grep_args")
		-- telescope.load_extension("media_files")
		vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
		vim.keymap.set("n", "<leader>a", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
		vim.cmd([[autocmd FileType qf nnoremap <buffer> t <c-w><cr><c-w>T]])

		local function telescope_buffer_dir()
			return vim.fn.expand("%:p:h")
		end

		vim.keymap.set("n", "ft", function()
			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = { height = 40 },
			})
		end)
	end,
}
