" ============================================================
" General
" ============================================================

set termguicolors

filetype plugin indent on
syntax enable


" ============================================================
" Plugins
" ============================================================

call plug#begin('~/.vim/plugged')

Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" ============================================================
" Theme / Statusline
" ============================================================

" Configure lightline before loading the colorscheme
let g:lightline = {
      \ 'colorscheme': 'catppuccin_mocha',
      \ }

colorscheme catppuccin_mocha


" ============================================================
" Editing behaviour
" ============================================================

set backspace=indent,eol,start

set history=1000
set undolevels=1000

" Faster CursorHold / plugin updates
set updatetime=250

" Faster mapping response
set timeoutlen=300
set ttimeoutlen=10


" ============================================================
" UI
" ============================================================

set number
set relativenumber
set cursorline

set showcmd
set noshowmode

set wrap
set linebreak
set breakindent

" Keep context around the cursor
set scrolloff=10
set sidescrolloff=10

set laststatus=2
set signcolumn=yes


" ============================================================
" Indentation
" ============================================================

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set shiftround


" ============================================================
" Search
" ============================================================

set ignorecase
set smartcase

set incsearch
set hlsearch


" ============================================================
" Windows / Buffers
" ============================================================

" Keyboard-only Vim
set mouse=

" Allow switching buffers without saving first
set hidden

set splitright
set splitbelow


" ============================================================
" Command completion
" ============================================================

set wildmenu
set wildmode=longest:full,full


" ============================================================
" Clipboard
" ============================================================

set clipboard=unnamedplus


" ============================================================
" Leader key
" ============================================================

let mapleader = " "


" ============================================================
" FZF mappings
" ============================================================

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>g :Rg<CR>


" ============================================================
" Search highlighting
" ============================================================

" Esc also clears search highlighting
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>


" ============================================================
" Window navigation
" ============================================================

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
