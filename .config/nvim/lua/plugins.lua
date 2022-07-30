-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'

    use 'itchyny/lightline.vim'

    use 'tpope/vim-surround'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    use 'neovim/nvim-lspconfig'
    -- "use 'ray-x/lsp_signature.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-path'
    use 'josa42/nvim-lightline-lsp'
    use 'kosayoda/nvim-lightbulb'

    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    use 'windwp/nvim-autopairs'

    use 'crusoexia/vim-monokai'
    use 'doums/darcula'
    use 'gruvbox-community/gruvbox'
    use 'severij/vadelma'

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'ThePrimeagen/vim-be-good'

    use 'norcalli/nvim-colorizer.lua'

    use 'numToStr/Comment.nvim'


end)
