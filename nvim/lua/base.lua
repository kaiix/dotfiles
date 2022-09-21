vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.ffs = "unix,dos,mac"

vim.opt.number = true
vim.opt.title = true
vim.opt.inccommand = "split"
vim.opt.path:append({ "**" }) -- Finding files in subdirectories
vim.opt.wildignore:append({ "*/node_modules/*", "venv/**" })

vim.opt.whichwrap:append("<,>,h,l")
vim.opt.mouse:remove("a")
vim.opt.showtabline = 2 -- always
vim.opt.colorcolumn = "88"

vim.g.mapleader = ","

-- appearance
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"
vim.g["&t_8f"] = "<Esc>[38:2:%lu:%lu:%lum"
vim.g["&t_8b"] = "<Esc>[48:2:%lu:%lu:%lum"

-- backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true -- default on
vim.opt.autoindent = true -- default on
vim.opt.smartindent = true -- default false
vim.opt.wrap = false
vim.cmd([[autocmd FileType javascript,javascriptreact,typescript setlocal shiftwidth=2 softtabstop=2 expandtab]])

-- scrolling
vim.opt.scrolloff = 8
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 15

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true -- default on
vim.opt.incsearch = true -- default on
vim.keymap.set("", "<leader>h", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.lazyredraw = true

-- folding
vim.opt.foldenable = false

-- same as default
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.history = 1000
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.autoread = true
vim.opt.ruler = true
vim.opt.magic = true
