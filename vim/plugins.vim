""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""
" Disable filetype plugins (required by Vundle)
" filetype off

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')

" Vundle
Plug 'gmarik/Vundle.vim'

" Linting
Plug 'dense-analysis/ale'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'gruvbox-community/gruvbox'

" Show git information
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'alvan/vim-closetag'

" Highlight current line
Plug 'miyakogi/conoline.vim'

call plug#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""

" Linting
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_linters = {'javascript': ['eslint'], 'python': ['pylint']}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_fixers = {'css': ['prettier'], 'html':['prettier'], 'javascript': ['prettier'], 'python': ['black']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_echo_cursor = 0

" NetRW file browser
let g:netrw_banner=0 " hide banner
let g:netrw_browse_split=0 " 0: re-use window, 2: open files in new vsplit
let g:netrw_altv=0 " I dunno
let g:netrw_liststyle=3 " show like a tree
"let g:netrw_winsize = 15 "percentual size of window

" Powerline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_z=""
let g:airline_section_error=""
let g:airline_section_warning=""
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
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

" Conoline
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1
let g:conoline_use_colorscheme_default_normal=1

" Git info
let g:signify_vcs_list = [ 'git' ]

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

filetype on
