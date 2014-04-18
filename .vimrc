set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'groenewege/vim-less'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'itchyny/lightline.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'SirVer/ultisnips'
Bundle 'tomtom/tcomment_vim'

filetype plugin indent on

" 256 Colors
set t_Co=256

" Tab stop
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent

" Syntax highligting
syntax enable
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
colorscheme solarized

" Clipboard
set clipboard=unnamedplus

" Highlight line with the cursor on
set cursorline

" Whitespace
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Ruler
set ruler
set laststatus=2

" Search options
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <CR> :noh<CR><CR>

" Don't show the mode
set noshowmode

" Per-directory vimrc
set exrc
set secure

" Tabs in makefiles
autocmd FileType make setlocal noexpandtab

" No folding in markdown
let g:vim_markdown_folding_disabled=1

" Shell
set shell=/bin/bash

" Lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste'],
    \             [ 'filename', 'readonly', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \   'modified': '%{&modified?"+":&modifiable?"":"-"}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
\ }

let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'V',
    \ 'c' : 'C',
    \ "\<C-v>": 'V',
    \ 's' : 'S',
    \ 'S' : 'S',
    \ "\<C-s>": 'S',
    \ '?': ' '
\ }

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


