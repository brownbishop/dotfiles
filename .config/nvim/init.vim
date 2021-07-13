filetype plugin on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

set termguicolors

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

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" parentheses
Plug 'tpope/vim-surround'

" syntax highlight
Plug 'jaxbot/semantic-highlight.vim'

" lsp and autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'

" Use release branch :(Recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" themes
Plug 'crusoexia/vim-monokai'
Plug 'gruvbox-community/gruvbox'
Plug 'severij/vadelma'
"Plug 'ntk148v/vim-horizon'
"Plug 'rktjmp/lush.nvim'

" extra colors
"Plug 'chrisbra/Colorizer'
"Plug 'ap/vim-css-color'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" snippets
Plug 'norcalli/snippets.nvim'

" html snippets
Plug 'mattn/emmet-vim'

" markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

call plug#end()


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

set autoread

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" custom rc
set exrc

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Indentation settings
set smartindent
set autoindent

"" Searching
set hlsearch
set incsearch
set ignorecase

" extra buffers
set hidden

set noerrorbells

set colorcolumn=80

set completeopt=menuone,noselect

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number relativenumber

"let no_buffers_menu=1
colorscheme gruvbox
set background=dark

set mousemodel=popup
set t_Co=256

set mouse=a          "" nicr

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

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'gruvbox'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#coc#enabled = 1
"let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

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

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv


noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +2<CR>
noremap <silent> <C-Right> :vertical resize -2<CR>
noremap <silent> <C-Up> :resize +2<CR>
noremap <silent> <C-Down> :resize -2<CR>

" set jj to esc, no language I know uses jj
:imap jj <Esc>


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

lua require('compe-config')

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp_signature
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require('lsp-signature-config')


