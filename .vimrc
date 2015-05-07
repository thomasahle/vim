set nocompatible

" Plugins
set shell=/bin/bash
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
"Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
call vundle#end()            " required
filetype plugin indent on    " required

set mouse=a

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

" Who wants an 8 character tab?  Not me!
set shiftwidth=3
set softtabstop=3

set nowrapscan
set incsearch                 " incremental search
set ignorecase                " search ignoring case
"set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set autoread

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set sidescroll=5
set listchars+=precedes:<,extends:>

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Line numbers
set number

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

iab codeforces
\import sys
\<CR>read = lambda f=int: map(f, sys.stdin.readline().split())
\<CR>array = lambda *ds: [array(*ds[1:]) for _ in range(ds[0])] if ds else 0
\<CR>
\<CR>N, = read()
\<CR>xs = read()
\<CR>

