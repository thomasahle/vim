set nocompatible

" Leader
"let mapleader="\<Space>"
map <Space> <leader>
nnoremap <Leader>a :echo "Hey there leader"<CR>

" Plugins
set shell=/bin/bash
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugin 'matchit.zip'
Plugin 'flazz/vim-colorschemes'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'lervag/vimtex'
call vundle#end()            " required
filetype plugin indent on    " required

"Tex
let vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let vimtex_view_general_options = '-r -g @line @pdf @tex'
" Husk \usepackage{pdfsync}
"nmap <leader>s :w<cr><leader>lv

set mouse=a
set clipboard=unnamed

" Colors
syntax enable
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme Monokai

set showcmd
set ruler
set encoding=utf-8
set listchars=tab:▒░,trail:▓
set list

" Spaces are better than a tab character
set expandtab
set smarttab
set nowrap
set backspace=2 " Allow deleting form insert mode

" Who wants an 8 character tab?  Not me!
set shiftwidth=3
set softtabstop=3

set nowrapscan
set incsearch                 " incremental search
set ignorecase                " search ignoring case
"set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set autoread

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Line numbers
set number

" For tex
set breakindent showbreak=..
set linebreak
set foldmethod=syntax
set wrap
map j gj
map k gk

" I want my surround on lower case S
map s ys


iab codeforces
\import sys
\<CR>read = lambda f=int: map(f, sys.stdin.readline().split())
\<CR>array = lambda *ds: [array(*ds[1:]) for _ in range(ds[0])] if ds else 0
\<CR>
\<CR>N, = read()
\<CR>xs = read()
\<CR>

