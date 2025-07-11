vim.cmd [[ filetype plugin indent on ]]

vim.g.mapleader = " "

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
local plugins = require("plugins")
require("lazy").setup(plugins)

require("sets")
require("abbreviations")
--require("telescope-config")
--require("treesitter-config")
--require("lsp-settings")
--require("cmp-config")
--

-- using defaults
--require("colorizer").setup()
require("Comment").setup()

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
