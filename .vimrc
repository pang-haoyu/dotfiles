" ============================================================
" Core Settings
" ============================================================
set nocompatible
set encoding=utf-8
set termguicolors

set backspace=indent,eol,start
set updatetime=300
set timeoutlen=500


" ============================================================
" Plugin Management (vim-plug)
" ============================================================
call plug#begin('~/.vim/plugged')

Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf',      { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" ============================================================
" Colorscheme
" ============================================================
colorscheme catppuccin_mocha


" ============================================================
" Leader Key
" ============================================================
let mapleader = " "


" ============================================================
" Key Mappings
" ============================================================
" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" FZF
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>g :Rg<Space>

" Clear search highlight
nnoremap <silent> <Leader>h :nohlsearch<CR>

" Fast split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


let g:lightline = { 'colorscheme': 'catppuccin_mocha' }


" ============================================================
" NERDTree Settings
" ============================================================
let NERDTreeMinimalUI  = 1
let NERDTreeQuitOnOpen = 1


" ============================================================
" Filetype & Syntax
" ============================================================
filetype plugin indent on
syntax enable


" ============================================================
" UI Settings
" ============================================================
set number
set relativenumber
set cursorline
set showcmd
set wrap
set scrolloff=5
set sidescrolloff=5
set laststatus=2
set noshowmode


" ============================================================
" Indentation
" ============================================================
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set shiftround


" ============================================================
" Search Behavior
" ============================================================
set ignorecase
set smartcase
set incsearch
set hlsearch


" ============================================================
" Mouse & Buffers
" ============================================================
set mouse=
set hidden


" ============================================================
" Split Behavior
" ============================================================
set splitright
set splitbelow

