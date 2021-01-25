" => Vim-plug For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

set nocompatible " required by vim-polyglot
let g:polyglot_disabled = ['autoindent', 'sensible']
"let g:ale_disable_lsp = 1

call plug#begin()
" autocompletion
" Use release branch :(Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" linting
"Plug 'dense-analysis/ale'

" syntax highlight
Plug 'sheerun/vim-polyglot'
"Plug 'bfrg/vim-cpp-modern'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'severin-lemaignan/vim-minimap'

" wiki
"Plug 'vimwiki/vimwiki'

" theme
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'branwright1/salvation-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'severij/vadelma'

" extra
Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'
" parentheses
Plug 'tpope/vim-surround'

" html
Plug 'mattn/emmet-vim'

" markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Control + y - yank
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" Control + p - paste
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" set jj to esc, no language I know uses jj
:imap jj <Esc>

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +2<CR>
noremap <silent> <C-Right> :vertical resize -2<CR>
noremap <silent> <C-Up> :resize +2<CR>
noremap <silent> <C-Down> :resize -2<CR>

" coc-explorer
nmap <space>e :CocCommand explorer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show statusline
set laststatus=2


"
"let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line number
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='zenburn'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=0
set ruler

"set autoindent

"" Fix backspace indent
set backspace=indent,eol,start

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

" Delete trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colo default
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a          "" nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch

"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"set guioptions-=r  "remove right-hand scroll bar
"set guioptions-=L  "remove left-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy and paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => coc.vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

set signcolumn=yes

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Alacritty fixes Vim only
""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has('nvim')
    set ttymouse=sgr
endif
