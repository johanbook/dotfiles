""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""
" Ignore compability with vi
set nocompatible

" Auto read when a file is changed from the outside
set autoread

" Ignore backup files
set nobackup
set nowb
set noswapfile

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Keep some lines as marginals when scrolling
set so=7

" Encoding
set encoding=utf-8

" Allow for recursive search
set path+=**

" Show several matches when searching
set wildmenu

" Use true colors
set termguicolors

" Activate omnicomplte
set omnifunc=syntaxcomplete#Complete

" Use tags
set tags^=./.git/tags;

source ~/.dotfiles/vim/filetypes.vim
source ~/.dotfiles/vim/mapping.vim
source ~/.dotfiles/vim/plugins.vim
source ~/.dotfiles/vim/snippets.vim

