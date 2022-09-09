local ok, solarized = pcall(require, "neosolarized")
if not ok then
	return
end

solarized.setup({
	comment_italics = true,
})
