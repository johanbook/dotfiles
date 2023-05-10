" Disable ALE LSP before plugins are loaded
let g:ale_disable_lsp = 1

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Linting and formatting
Plug 'dense-analysis/ale'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'gruvbox-community/gruvbox'

" Basic Git integration
Plug 'tpope/vim-fugitive'

" Show git diffs in number column
" and some neat commands
Plug 'mhinz/vim-signify'

" General useful stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Highlight current line
Plug 'miyakogi/conoline.vim'

" Fuzzy file navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Start in root folder. Needed for Fzf and vim-test
" to work properly
Plug 'airblade/vim-rooter'

" Test runner
Plug 'vim-test/vim-test'

" Plugin for easily switch between related files
Plug 'tpope/vim-projectionist'

" Fancy start screen
Plug 'mhinz/vim-startify'

" R terminal integration
Plug 'jalvesaq/Nvim-R'

" Improved motions for navigation
Plug 'easymotion/vim-easymotion'

" Toggle window maximization
Plug 'szw/vim-maximizer'

call plug#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
"" Plugin settings
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" Color scheme
""""""""""""""""""""""""""""""""
set background=dark

let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_termcolors=16

" Unset background so we can use that sweet transparency
hi Normal ctermbg=NONE guibg=NONE
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
autocmd VimEnter * hi SignColumn ctermbg=NONE guibg=NONE

colorscheme gruvbox


""""""""""""""""""""""""""""""""
" NetRW file browser
""""""""""""""""""""""""""""""""
let g:netrw_altv = 0 " I dunno
let g:netrw_banner = 0 " Hide banner
let g:netrw_browse_split = 0 " 0: re-use window, 2: open files in new vsplit
let g:netrw_liststyle = 3 " Show like a tree
"let g:netrw_winsize = 15 "percentual size of window


""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""
" let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

function! VenvReporter()
  if &filetype != "python"
    return ""
  endif

  let venv = $VIRTUAL_ENV
  if empty(venv)
    return ""
  endif

  " Name is on format a/b/c/a-t-d...
  " This creates a prefix
  let parts = split(venv, "/")[-1]
  let prefix = split(parts, "-")[0]
  return printf("%s%s", g:airline_symbols.python, prefix)
endfunction

" let g:airline#themes#base16_gruvbox_dark_hard#palette.accents.blue = [ '#ff0000' , '' , 160 , ''  ]

call airline#parts#define_function('venv', 'VenvReporter')
" call airline#parts#define_accent('venv', 'red')


" NB: Defined inside autocmd to support lazyily loading plugins
function! AirlineInit()
  let g:airline_section_a = airline#section#create(["mode"])
  let g:airline_section_c = airline#section#create(["crypt", "spell", " ", "linenr"])
  let g:airline_section_x = airline#section#create(["filetype", " ", "venv"])
  let g:airline_section_y = ""
  let g:airline_section_z = ""
endfunction
autocmd User AirlineAfterInit call AirlineInit()


" Very seldom needed
let g:airline#extensions#wordcount#enabled = 0

" Tabline
let g:airline#extensions#tabline#enabled = 1

" I have no clue what this is doing but sure
let g:airline#extensions#fzf#enabled = 1

" Skip showing number of changed lines etc
let g:airline#extensions#hunks#enabled = 0

" ALE Integration
let airline#extensions#ale#error_symbol = '❌:'
let airline#extensions#ale#warning_symbol = '⚠ :'
let airline#extensions#ale#show_line_numbers = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = '暈'
let g:airline_symbols.notexists = '?'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='!'
let g:airline_symbols.python = ' '


""""""""""""""""""""""""""""""""
" Conoline
""""""""""""""""""""""""""""""""
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert = 1
let g:conoline_use_colorscheme_default_normal = 1


""""""""""""""""""""""""""""""""
" Signify
""""""""""""""""""""""""""""""""
let g:signify_vcs_list = [ 'git' ]

" Custom highlight groups to support background transparency
highlight SignifySignAdd ctermbg=NONE guibg=NONE ctermfg=green
highlight SignifySignChange ctermbg=NONE guibg=NONE ctermfg=yellow
highlight SignifySignChangeDelete ctermbg=NONE guibg=NONE ctermfg=yellow
highlight SignifySignDelete ctermbg=NONE guibg=NONE ctermfg=red
highlight SignifySignDeleteFirstLine ctermbg=NONE guibg=NONE ctermfg=red


""""""""""""""""""""""""""""""""
" CoC
""""""""""""""""""""""""""""""""
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Navigate with tab and s-tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>

let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = 'vsp'
let g:coc_global_extensions = [
\ 'coc-dictionary',
\ 'coc-docker',
\ 'coc-json',
\ 'coc-highlight',
\ 'coc-markdownlint',
\ 'coc-marketplace',
\ 'coc-tsserver',
\ 'coc-omni',
\ 'coc-pairs',
\ 'coc-python',
\ 'coc-r-lsp',
\ 'coc-sh',
\ 'coc-syntax',
\ 'coc-tabnine',
\ 'coc-tag',
\ 'coc-yaml',
\ 'coc-word',
\ ]


""""""""""""""""""""""""""""""""
" Linting (ALE)
""""""""""""""""""""""""""""""""
" Needed to support transparency in sign backgrounds
highlight ALEErrorSign guibg=NONE guifg=red ctermfg=red
highlight ALEInfoSign guibg=NONE guifg=blue ctermfg=blue
highlight ALEWarningSign guibg=NONE guifg=yellow ctermfg=red

" NB: Recommnded to have a global installation of `prettier`
let g:ale_sign_error = '❌'
let g:ale_sign_info = ''
let g:ale_sign_warning = '⚠'
let g:ale_sign_style_error = 'e'
let g:ale_sign_style_info = 'i'
let g:ale_sign_style_warning = 'w'
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'javascriptreact': ['eslint'],
      \ 'python': ['pylint'],
      \ 'r': ['lintr'],
      \ 'sh': [ 'spellcheck']
\}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_fixers = {
 \ "*": ["remove_trailing_lines", "trim_whitespace"],
     \ 'css': ['prettier'],
      \ 'html':['prettier'],
      \ 'javascript': ['prettier'],
      \ 'javascriptreact': ['prettier'],
      \ 'json': ['prettier'],
      \ 'markdown':['prettier'],
      \ 'python': ['black', 'isort'],
      \ 'r': [ 'styler'],
      \ 'sh': [ 'shfmt'],
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0 " Autocompletion is handled by CoC
let g:ale_echo_cursor = 1
let g:ale_hover_cursor = 1
let g:ale_virtualtext_cursor = "disabled"

" Python envs are handled by pipenv
let g:ale_virtualenv_dir_names = [ ]
let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_auto_pipenv = 1

" Custom CLI options
let g:ale_javascript_prettier_options = "--prose-wrap always"


""""""""""""""""""""""""""""""""
" Projectionist
""""""""""""""""""""""""""""""""
let g:projectionist_heuristics = {
      \ "*": {
      \ "*.js": {"alternate": "{}.test.js", "type": "source"},
      \ "*.jsx": {"alternate": "{}.test.jsx", "type": "source"},
      \ "*.ts": {"alternate": "{}.test.ts", "type": "source"},
      \ "*.tsx": {"alternate": "{}.test.tsx", "type": "source"},
      \ "*.test.js": {"alternate": "{}.js", "type": "test"},
      \ "*.test.jsx": {"alternate": "{}.jsx", "type": "test"},
      \ "*.test.ts": {"alternate": "{}.ts", "type": "test"},
      \ "*.test.tsx": {"alternate": "{}.tsx", "type": "test"},
      \ "test_*.py": {"alternate": "{file|dirname|dirname}/{basename}.py", "type": "source"},
      \ "*.py": {"alternate": "{dirname}/test/test_{basename}.py", "type": "test"}
      \}}


""""""""""""""""""""""""""""""""
" Testing (vim-test)
""""""""""""""""""""""""""""""""
let test#strategy = "vimterminal"

" Avoid interactive run as we cannot
" interact with it anyways
let test#javascript#reactscripts#options = '--watchAll=false'


""""""""""""""""""""""""""""""""
" Fzf
""""""""""""""""""""""""""""""""
" let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'down': '40%' }

" Window for previewing found match (such as file content)
let g:fzf_preview_window = ['right:50%:noborder', 'ctrl-/']

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


""""""""""""""""""""""""""""""""
" vim-startify
""""""""""""""""""""""""""""""""
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = ''
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists= [
      \ { 'header': ['  Commands'], 'type': 'commands'},
      \ { 'header': ['  Recent in '. getcwd()], 'type': 'dir'},
      \ { 'header': ['  Projects'], 'type': 'bookmarks'},
\ ]


let g:startify_commands= [
      \ ["Git", "G"],
      \ ["GFiles", "GFiles"],
      \ ["Files", "Files"],
      \ ["Rg", "Rg"]
\ ]


" Unique to computer Lagrande
let g:startify_bookmarks= [
      \ { ".": "~/.dotfiles" },
      \ { "c": "~/capabilities" },
      \ { "a": "~/d2api" },
      \ { "u": "~/d2ui" },
      \ { "m": "~/mynstur" },
\ ]


""""""""""""""""""""""""""""""""
" nvim-r
""""""""""""""""""""""""""""""""
let R_assign = 0
let R_args = ['--no-save', '--quiet']

" Some handy shortcuts.
" NB: D stands for move Down
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendParagraph
