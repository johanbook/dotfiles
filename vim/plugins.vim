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

set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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

" Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <Leader>g <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('doHover')
endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
" autocmd!
" " Setup formatexpr specified filetype(s).
" autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" " Update signature help on jump placeholder
" autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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

nnoremap <silent> <C-y>  :<C-u>CocList -A --normal yank<cr>
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Linting
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_linters = {'javascript': ['eslint'], 'javascriptreact': ['eslint'], 'python': ['pylint']}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_fixers = {'css': ['prettier'], 'html':['prettier'], 'javascript': ['prettier'], 'javascriptreact': ['prettier'], 'json': ['prettier'], 'python': ['black'], 'typescript': ['prettier'], 'typescriptreact': ['prettier']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_echo_cursor = 1
