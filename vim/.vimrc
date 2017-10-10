set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'groenewege/vim-less'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'itchyny/lightline.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'sophacles/vim-processing'
Bundle 'armyofevilrobots/vim-openscad'
Bundle 'wting/rust.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'tpope/vim-abolish'
Bundle 'pangloss/vim-javascript'
Bundle 'MaxMEllon/vim-jsx-pretty'
Bundle 'SirVer/ultisnips'
Bundle 'sbdchd/neoformat'


call vundle#end()

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

" Make prototype and this a bit less noisy with vim-javascript
hi! link jsPrototype Identifier
hi! link jsThis Identifier

" Clipboard
set clipboard=unnamedplus

" Highlight line with the cursor on
set cursorline

" Highlight at 80 columns
set cc=80

" Whitespace
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Ruler
set ruler
set laststatus=2

" Search options
set incsearch
set hlsearch
set smartcase
nnoremap <silent> <CR> :noh<CR><CR>

" Don't show the mode
set noshowmode

" Per-directory vimrc
set exrc
set secure

" Force write on save, so inotify is notified
set backupcopy=yes

" Tabs in makefiles
autocmd FileType make setlocal noexpandtab

" No folding in markdown
let g:vim_markdown_folding_disabled=1

" Spellcheck markdown
autocmd BufRead,BufNewFile *.md setlocal spell

" Two space indentation in package.json
autocmd BufRead,BufNewFile package.json setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Two space indentation in yaml
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Mustache-markdown hybrid in master syllabus
autocmd BufNewFile,BufRead ~/documents/curricula/full_time_career_path/master-syllabus/*.md set syntax=markdown.mustache

" Automatic prettier
autocmd BufWritePre *.js Neoformat prettier

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

" SCVim
let g:sclangTerm = "gnome-terminal -x $SHELL -ic"

" UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsEnableSnipMate=0
let g:UltiSnipsSnippetsDir="~/.vim/custom-snippets"
let g:UltiSnipsSnippetDirectories=["custom-snippets"]
