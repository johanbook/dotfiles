" Disable ALE LSP before plugins are loaded
let g:ale_disable_lsp = 1 

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Linting
Plug 'dense-analysis/ale'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'gruvbox-community/gruvbox'

" Show git information
Plug 'tpope/vim-fugitive'

" Show git diffs
Plug 'mhinz/vim-signify' 

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Highlight current line
Plug 'miyakogi/conoline.vim'

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Start in root folder. Needed for Fzf and vim-test
" to work properly
Plug 'airblade/vim-rooter'

" Test runner
 Plug 'vim-test/vim-test'

call plug#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" NetRW file browser
""""""""""""""""""""""""""""""""
let g:netrw_banner=0 " Hide banner
let g:netrw_browse_split=0 " 0: re-use window, 2: open files in new vsplit
let g:netrw_altv=0 " I dunno
let g:netrw_liststyle=3 " Show like a tree
"let g:netrw_winsize = 15 "percentual size of window

""""""""""""""""""""""""""""""""
" Powerline
""""""""""""""""""""""""""""""""
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
colorscheme gruvbox


""""""""""""""""""""""""""""""""
" Conoline
""""""""""""""""""""""""""""""""
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1
let g:conoline_use_colorscheme_default_normal=1


""""""""""""""""""""""""""""""""
" Git info
""""""""""""""""""""""""""""""""
let g:signify_vcs_list = [ 'git' ]


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

" Remap keys for gotos
nmap <silent> <Leader>g <Plug>(coc-definition)

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
\ 'coc-syntax',
\ 'coc-tabnine',
\ 'coc-tag',
\ 'coc-yaml',
\ 'coc-word',
\ ]


""""""""""""""""""""""""""""""""
" Linting (ALE)
""""""""""""""""""""""""""""""""
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_linters = {'javascript': ['eslint'], 'javascriptreact': ['eslint'], 'python': ['pylint']}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_fixers = {
     \ 'css': ['prettier'], 
      \ 'html':['prettier'], 
      \ 'javascript': ['prettier'], 
      \ 'javascriptreact': ['prettier'], 
      \ 'json': ['prettier'], 
      \ 'markdown':['prettier'],
      \ 'python': ['black'], 
      \ 'typescript': ['prettier'], 
      \ 'typescriptreact': ['prettier'],
      \ 'vim': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0 " Autocompletion is handled by CoC
let g:ale_echo_cursor = 1

let g:ale_hover_cursor = 1
let g:ale_set_balloons = 1

" Go to errors
nmap <silent> <leader>e <Plug>(ale_previous_wrap)
nmap <silent> <leader>r <Plug>(ale_next_wrap)


""""""""""""""""""""""""""""""""
" Testing (vim-test)
""""""""""""""""""""""""""""""""
nmap <silent> <Leader>t :TestNearest<CR> 

let test#strategy = "vimterminal"
let g:test#javascript#runner = 'reactscripts'
let test#javascript#reactscripts#options = '--ci'
" let test#vim#term_position = "belowright"
let g:test#preserve_screen = 1


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

