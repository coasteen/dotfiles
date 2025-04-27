syntax on
set number
set numberwidth=4
set cpoptions+=n
set mouse=a
set relativenumber
set cursorline
set bg=dark
set tabstop=4
set shiftwidth=4
set expandtab  " Convert tabs to spaces
set autoindent
set smartindent
set incsearch
filetype plugin indent on
set showcmd
set laststatus=2
set wildmenu
set wildmode=longest:full,full
set termguicolors
set t_Co=256
set hidden
set smoothscroll
let mapleader = " "
nnoremap <silent> <leader>cd :Ex<CR>
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'  " Example plugin
Plug 'preservim/nerdtree'  " Another example
call plug#end()

