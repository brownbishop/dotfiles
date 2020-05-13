
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

"Plug 'crusoexia/vim-monokai'
" my theme
Plug 'mcmartelle/vim-monokai-bold'
" Use release branch :(Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mxw/vim-prolog'
" cpp syntax
Plug 'vim-airline/vim-airline'					" Airline
Plug 'vim-airline/vim-airline-themes'				" Airline Themes
Plug 'scrooloose/nerdtree'						" added nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'severin-lemaignan/vim-minimap'
Plug 'vimwiki/vimwiki'                            " Vim wiki
"Plugin 'ap/vim-css-color'                           " Color previews for CSS
Plug 'tpope/vim-surround'                         " Change surrounding marks
"Plugin 'klen/python-mode'                          " Python Mode
call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap ESC to ii
"Nobody uses ww in Romanian and English exept www.
imap ii <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
" set t_Co=256

syntax enable
set relativenumber
let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colo default


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
set nobackup
set noswapfile

let g:minimap_highlight='Visual'

let g:python_highlight_all = 1


set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fixes mouse issues using Alacritty terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttymouse=sgr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent

nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

"set bg=dark
set go=a
set clipboard+=unnamedplus
set number relativenumber
colorscheme monokai-bold

" => Delete trailing whitespaces on save

autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => coc.vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

set signcolumn=yes


