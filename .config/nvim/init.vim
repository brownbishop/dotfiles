filetype plugin indent on

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

" fix CursorHold performance
Plug 'antoinemadec/FixCursorHold.nvim'

" misc
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse

" git integration
Plug 'tpope/vim-fugitive'

" status line
Plug 'itchyny/lightline.vim'

" parentheses
Plug 'tpope/vim-surround'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" lsp and autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-path'
Plug 'josa42/nvim-lightline-lsp'
Plug 'mfussenegger/nvim-jdtls'

" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" pairs
Plug 'windwp/nvim-autopairs'

" Keep it here in case I need it
" Use release branch :(Recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" themes
Plug 'crusoexia/vim-monokai'
Plug 'gruvbox-community/gruvbox'
Plug 'severij/vadelma'

" extra colors
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" html snippets
" Plug 'mattn/emmet-vim'


Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" games
Plug 'ThePrimeagen/vim-be-good'

Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

set termguicolors
"set wildmode=list,full
set wildmenu

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" custom rc
set exrc

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"" Indentation settings
set smartindent

"" Searching
set incsearch

set hidden
set noerrorbells
set colorcolumn=80
set fileformats=unix,dos,mac

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
set ruler
set number
set relativenumber

"let no_buffers_menu=1
colorscheme gruvbox
set background=dark
" blue line numbers
highlight LineNr guifg=#5eacd3

set mousemodel=popup
set mouse=a

"" Status bar
"set laststatus=2

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

" Delete trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"*****************************************************************************
"" Mappings
"*****************************************************************************

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

nnoremap Y y$

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +2<CR>
noremap <silent> <C-Right> :vertical resize -2<CR>
noremap <silent> <C-Up> :resize +2<CR>
noremap <silent> <C-Down> :resize -2<CR>

" set jj to esc, no language I know uses jj
imap jj <Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => telesope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require('telescope-config')

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => treesitter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('treesitter-config')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LSP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('lsp-settings')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require('cmp-config')

" Expand or jump for snippets
imap <expr> <C-l>   luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-l>'
smap <expr> <C-l>   luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-l>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp_signature
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require('lsp-signature-config')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:lightline = {
"    \ 'colorscheme': 'gruvbox',
"    \ 'active': {
"	\   'left': [ [ 'mode', 'paste' ],
"	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"	\ },
"	\ 'component_function': {
"	\   'cocstatus': 'coc#status'
"	\ },
"	\ }
"
"  " Use autocmd to force lightline update.
"  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \   'active': {
  \     'left': [['mode', 'paste'],
  \              [  'lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok', 'readonly', 'filename', 'modified' ],
  \              [ 'lsp_status' ]]
  \   }
  \ }

" register compoments:
call lightline#lsp#register()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require('nvim-tree').setup()
nnoremap <M-e> :NvimTreeToggle<CR>

" colorizer
lua require'colorizer'.setup()

" pairs
lua require('nvim-autopairs').setup{}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"source ~/.config/nvim/coc-nvim-config.vim

