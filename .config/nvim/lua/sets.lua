-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.wildmenu = true
vim.opt.encoding = "utf-8"
-- vim.opt.fileencoding = "utf-8"

vim.opt.exrc = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = false
vim.opt.smartindent = false
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.colorcolumn = "80"

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.visualbell = false
-- vim.opt.clipboard:append("unnamedplus")

vim.opt.mouse = "a"
-- vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- vim.opt.updatetime = 50
