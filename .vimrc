" ============================================================================
"                              Core Vim Settings
" ============================================================================

set nocompatible
set encoding=utf-8
set termguicolors


" ----------------------------------------------------------------------------
" History, Undo, and Timing
" ----------------------------------------------------------------------------
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set updatetime=300
set timeoutlen=500
set ttimeoutlen=10


" ============================================================================
"                           Plugin Management (vim-plug)
" ============================================================================

call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Statusline
Plug 'itchyny/lightline.vim'

" Fuzzy finder
Plug 'junegunn/fzf',      { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" ============================================================================
"                               Theme & UI
" ============================================================================

colorscheme catppuccin_mocha
let g:lightline = { 'colorscheme': 'catppuccin_mocha' }

set number
set relativenumber
set cursorline
set showcmd
set wrap
set scrolloff=5
set sidescrolloff=5
set laststatus=2
set noshowmode
set signcolumn=yes


" ============================================================================
"                                Leader Key
" ============================================================================

let mapleader = " "


" ============================================================================
"                       File Navigation & Window Management
" ============================================================================

" FZF mappings
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>g :Rg<CR>

" Clear search highlighting
nnoremap <silent> <Leader>h :nohlsearch<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" ============================================================================
"                          Filetype & Syntax Support
" ============================================================================

filetype plugin indent on
syntax enable


" ============================================================================
"                           Indentation & Tabs
" ============================================================================

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set shiftround


" ============================================================================
"                              Search Behavior
" ============================================================================

set ignorecase
set smartcase
set incsearch
set hlsearch


" ============================================================================
"                        General Editing & Window Behavior
" ============================================================================

set mouse=
set hidden
set wildmenu
set wildmode=longest:full,full

set splitright
set splitbelow

