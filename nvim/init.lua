require("base")
require("mapping")
require("system")

-- vim.api.nvim_create_augroup("Lazy", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = "Lazy",
--     pattern = "*/lua/*.lua",
--     callback = function()
--         vim.cmd("source <afile>")
--     end,
-- })

-- lazy
local function install_lazy()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end

install_lazy()
require("lazy").setup("plugins")
