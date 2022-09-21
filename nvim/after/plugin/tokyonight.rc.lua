local ok, tokyonight = pcall(require, "tokyonight")

if not ok then
	return
end

tokyonight.setup({
	style = "storm",
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help" },
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = false,
})
