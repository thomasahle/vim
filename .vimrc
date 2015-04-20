set nocompatible

" Plugins
set shell=/bin/bash
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
call vundle#end()            " required
filetype plugin indent on    " required

" Colors
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set showcmd

" Spaces are better than a tab character
"set expandtab
"set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=3
set softtabstop=3

" Line numbers
set number

iab codeforces 
\import sys
\<CR>read = lambda f=int: map(f, sys.stdin.readline().split())
\<CR>array = lambda *ds: [array(*ds[1:]) for _ in range(ds[0])] if ds else 0
\<CR>
\<CR>N, = read()
\<CR>xs = read()
\<CR>

