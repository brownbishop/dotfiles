-- lazy nvim plugins
return {
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

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
    'folke/tokyonight.nvim',
    'ellisonleao/gruvbox.nvim',
    'rose-pine/neovim',
    'norcalli/nvim-colorizer.lua',
}
