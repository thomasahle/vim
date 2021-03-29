set nocompatible

" Leader
map <Space> <leader>
nnoremap <Leader>a :echo "Hey there leader"<CR>

" Plugins
set shell=/bin/bash
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
"Plugin 'matchit.zip'
Plugin 'flazz/vim-colorschemes'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'tpope/vim-surround'
"Plugin 'SirVer/ultisnips'
Plugin 'kana/vim-operator-user'
Plugin 'kana/vim-textobj-user'
Plugin 'rhysd/vim-operator-surround'
"Plugin 'sgur/vim-textobj-parameter'
Plugin 'kien/ctrlp.vim'
Plugin 'lervag/vimtex'

Plugin 'zxqfl/tabnine-vim'
"Plugin 'rhysd/vim-grammarous'
"Plugin 'w0rp/ale'

"Plugin 'Shougo/unite.vim'
"Plugin 'rhysd/unite-redpen.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'rhysd/committia.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'google/yapf', { 'rtp': 'plugins/vim' }
call vundle#end()            " required
filetype plugin indent on    " required

" autocompletion window turn off
set completeopt=menu

" Tex
"let g:vimtex_compiler_method = 'arara'
"let g:vimtex_quickfix_open_on_warning = 0
"let g:tex_flavor = 'latex'
"
let g:vimtex_view_method='skim'
"let vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
"let vimtex_view_general_options = '-r -g @line @pdf @tex'
"
"let g:formatdef_latexindent = '"latexindent --logfile=/dev/null -y=\"defaultIndent:\\\"" . repeat(" ", &shiftwidth) . "\\\"\""'
"let g:formatters_tex = ['latexindent']

" Following https://castel.dev/post/lecture-notes-1/
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {'callback' : 0, 'build_dir': 'build'}
let g:tex_comment_nospell = 1

" Husk \usepackage{pdfsync}
" Virker ikke
"nmap <leader>s :w<cr><leader>lv

" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

"let g:operator#surround#no_default_blocks = 1
"let g:operator#surround#blocks = {
"\ '-' : [
"\  {'block': ['\langle ', '\rangle '], 'motionwise': ['char', 'line', 'block'], 'keys': ['<',"'>']},
"\  {'block': ['\\langle', '\\rangle'], 'motionwise': ['char', 'line', 'block'], 'keys': []},
"\ ] }
"call textobj#user#plugin('latex', {
"\   'code': {
"\     'pattern': ['\\langle', '\\rangle'],
"\     'select-a': 'a<',
"\     'select-i': 'i<',
"\   },
"\ })
" Ignore Tex warnings
" Disable all warnings
"let g:vimtex_quickfix_latexlog = {'default' : 0}
"let g:vimtex_quickfix_open_on_warning = 0

" Spelling
"setlocal spell
" I'm tired of spelling errors in my python variables and strings
autocmd BufEnter *.tex setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" autocmd FileType plaintex,tex,latex syntax spell toplevel

set mouse=a
"set clipboard=unnamedplus
set clipboard=unnamed


set undodir=~/.vim/undodir
set undofile

" Colors
syntax enable
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme Monokai
" You complete me
highlight Pmenu ctermbg=237 ctermfg=250
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

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_root_markers = ['supermajority.bib', '*.bib']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" Line numbers
set number

" Syntastic
let g:syntastic_python_python_exec = 'python3'
"let g:syntastic_python_pylint_exec = 'python3-pylint'
let g:syntastic_quiet_messages = { "type": "style" }

" For tex
set breakindent showbreak=..
set linebreak
"set foldmethod=syntax
set wrap
map j gj
map k gk

map <C-Y> :call yapf#YAPF()<cr>
"imap <C-Y> <c-o>:call yapf#YAPF()<cr>

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

iab codejam 
\import sys
\<CR>
\<CR>read = lambda f=int: map(f, sys.stdin.readline().split())
\<CR>array = lambda *ds: [array(*ds[1:]) for _ in range(ds[0])] if ds else 0
\<CR>
\<CR>T, = read()
\<CR>for test_case in range(T):
\<CR>xs = read()
\<CR>print('Case #{}:'.format(test_case+1), result)
