""""""""""""""""""""""""""""""""""""""""
" Johans .vimrc file
""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'

" Indentation and folding
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'

" Linting
Plugin 'nvie/vim-flake8'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'

" Airline powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""

" Autocompletion
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Simply Folds
let g:SimpylFold_docstring_preview=1


" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-o> :NERDTreeToggle<CR>


" Powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=1

" Color scheme
colo delek

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Encoding
set encoding=utf-8


""""""""""""""""""""""""""""""""""""""""
" File specific formatting
""""""""""""""""""""""""""""""""""""""""

" Python formatting
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set number

" HTML/CSS/JS formatting
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2


""""""""""""""""""""""""""""""""""""""""
" Final settings
""""""""""""""""""""""""""""""""""""""""
let python_highlight_all=1
syntax on

set clipboard=unnamed
