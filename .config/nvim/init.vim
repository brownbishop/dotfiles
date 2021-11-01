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
Plug 'nvim-lualine/lualine.nvim'

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
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'

" flutter
Plug 'akinsho/flutter-tools.nvim'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" pairs

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

" markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}


Plug 'kyazdani42/nvim-web-devicons'

" games
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

set termguicolors
set wildmode=longest,list,full
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
set hlsearch
set incsearch
set ignorecase

set hidden
set noerrorbells
set colorcolumn=80
set fileformats=unix,dos,mac

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
set ruler
set relativenumber

"let no_buffers_menu=1
colorscheme gruvbox
set background=dark

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

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
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

"" Swenuitching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

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

lua require('cmp-config')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp_signature
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require('lsp-signature-config')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'coc', 'nvim_lsp'}}},
    lualine_c = {'filename', 'lsp_progress'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"source ~/.config/nvim/coc-nvim-config.vim

