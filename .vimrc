""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""
" Ignore compability with vi
set nocompatible

" Auto read when a file is changed from the outside
set autoread

" Use system clipboard
set clipboard=unnamed,unnamedplus

" We want directory to stay at project root.
" This is handled by plugin vim-rooter
set noautochdir

" Better display for messages
set cmdheight=2

" Ignore backup files
set nobackup
set nowritebackup
set noswapfile

" Ignore case when searching
set ignorecase

" Use case-sensative search iff query contains
" uppercase letters
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show line numbers
set number

" Keep some lines as marginals when scrolling
set scrolloff=14

" Encoding
set encoding=utf-8

" Allow for recursive search
set path+=**

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" Show several matches when searching
set wildmenu

" Vim wraps long line by default, which behaves
" funky when viewing e.g. minified JS. It can
" instead be turned on on a buffer-basis
set nowrap

" Fixes Vim freezing on Mac
set re=2

" Scripts
source ~/.dotfiles/vim/filetypes.vim
source ~/.dotfiles/vim/mapping.vim
source ~/.dotfiles/vim/plugins.vim
source ~/.dotfiles/vim/snippets.vim
