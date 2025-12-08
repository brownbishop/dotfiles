-- lazy nvim plugins
return {
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    'neovim/nvim-lspconfig',

    -- {
    --     'saghen/blink.cmp',
    --     dependencies = 'rafamadriz/friendly-snippets',
    --     version = '*',
    --     opts = {
    --         keymap = { preset = 'default' },
    --         appearance = {
    --             -- Sets the fallback highlight groups to nvim-cmp's highlight groups
    --             -- Useful for when your theme doesn't support blink.cmp
    --             -- Will be removed in a future release
    --             use_nvim_cmp_as_default = true,
    --             -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    --             -- Adjusts spacing to ensure icons are aligned
    --             nerd_font_variant = 'mono'
    --         },
    --
    --         -- Default list of enabled providers defined so that you can extend it
    --         -- elsewhere in your config, without redefining it, due to `opts_extend`
    --         sources = {
    --             default = { 'lsp', 'path', 'snippets', 'buffer' },
    --         },
    --     },
    --     opts_extend = { "sources.default" }
    -- },

    -- 'hrsh7th/cmp-nvim-lsp',
    -- 'hrsh7th/cmp-nvim-lsp-signature-help',
    -- 'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-path',
    -- 'hrsh7th/cmp-cmdline',
    -- 'hrsh7th/nvim-cmp',

    -- 'saadparwaiz1/cmp_luasnip',
    {
        'neoclide/coc.nvim',
        branch = 'release'
    },

    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    'numToStr/Comment.nvim',
    {
    'nvim-lualine/lualine.nvim',
      dependncies = { 'kyazdani42/nvim-web-devicons' }
    },
    {
    "rcarriga/nvim-dap-ui",
      dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
    },
    'leoluz/nvim-dap-go',
    'folke/tokyonight.nvim',
    'ellisonleao/gruvbox.nvim',
    'rose-pine/neovim',
    'norcalli/nvim-colorizer.lua',
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end
    },
    -- 'micangl/cmp-vimtex',
    {
        'kaarmu/typst.vim',
        ft = 'typst',
        lazy=false,
    },
    'nvim-tree/nvim-tree.lua',
}
