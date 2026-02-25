set nocompatible
set encoding=utf-8
set termguicolors


set backspace=indent,eol,start
set history=1000
set undolevels=1000
set updatetime=300
set timeoutlen=500
set ttimeoutlen=10


call plug#begin('~/.vim/plugged')

Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf',      { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


colorscheme catppuccin_mocha
let g:lightline = { 'colorscheme': 'catppuccin_mocha' }


set number
set relativenumber
set cursorline
set showcmd
set wrap
set linebreak
set breakindent
set scrolloff=5
set sidescrolloff=5
set laststatus=2
set noshowmode
set signcolumn=yes


let mapleader = " "


nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>g :Rg<CR>

nnoremap <silent> <Leader>h :nohlsearch<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


filetype plugin indent on
syntax enable


set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set shiftround


set ignorecase
set smartcase
set incsearch
set hlsearch


set mouse=
set hidden
set wildmenu
set wildmode=longest:full,full

set splitright
set splitbelow

