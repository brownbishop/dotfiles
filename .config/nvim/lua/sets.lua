vim.opt.termguicolors = true
vim.opt.wildmenu = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.exrc = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
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
vim.opt.clipboard:append("unnamedplus")

vim.opt.mouse = "a"
vim.cmd [[
    colorscheme gruvbox
    set background=dark
    " blue line numbers
    highlight LineNr guifg=#5eacd3
]]

