require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash",
        "java",
        "javascript",
        "html",
        "json",
        "css",
        "c",
        "python",
        "cpp",
        "toml",
        "go"
    },
    --"maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { }, -- List of parsers to ignore installing
    highlight = {
        enable = true,              -- false will disable the whole extension
        disable = { },  -- list of language that will be disabled
    },
    indent = {
        enable = false,
    },
}
