vim.cmd [[ filetype plugin indent on ]]

require("plugins")
require("sets")
require("abbreviations")
require("telescope-config")
require("treesitter-config")
require("lsp-settings")
require("cmp-config")

-- using defaults
require("colorizer").setup()
require("nvim-autopairs").setup()
require("Comment").setup()

vim.api.nvim_set_var("lightline", {
    colorscheme = "gruvbox",
    active = {
        left = {{'mode', 'paste'},
              {  'lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok', 'readonly', 'filename', 'modified' },
              { 'lsp_status' }
         }
    }
})

vim.fn['lightline#lsp#register']()

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
