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

" Folding
Plugin 'tmhedberg/SimpylFold'

" Linting
Plugin 'dense-analysis/ale'

" Syntax highlighting
Plugin 'sheerun/vim-polyglot'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'

" Airline powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'itchyny/lightline.vim'

" Theme
Plugin 'gruvbox-community/gruvbox'

" Show git information
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'

" Highlight current line
Plugin 'miyakogi/conoline.vim'

call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""

" Autocompletion
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Make virtual env available (needed for autocompletion)
" python3 << EOF
" import os
" import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" Simply Folds
let g:SimpylFold_docstring_preview=1

" Linting
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-o> :NERDTreeToggle<CR>


" Powerline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_z=""
let g:airline_section_error=""
let g:airline_section_warning=""
let g:airline_skip_empty_sections = 1
>
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.dirty=''
<

" Color scheme
set background=dark
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_plugin_hi_groups = 1
colorscheme gruvbox

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Encoding
set encoding=utf-8

" Conoline
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1

" Git info
let g:signify_vcs_list = [ 'git' ]

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

au BufNewFile,BufRead *.js
    \ set number


""""""""""""""""""""""""""""""""""""""""
" Final settings
""""""""""""""""""""""""""""""""""""""""
let python_highlight_all=1
syntax on

set clipboard=unnamed

