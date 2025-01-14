""""""""""""""""""""""""""""""""""""""""
" File specific formatting
""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFIle *.md,*.txt
   \ setlocal spell |
   \ setlocal nonumber |

" HTML/CSS/JS formatting
au BufNewFile,BufRead *.js,*.jsx,*.html,*.css,*.ts,*.tsx
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2

au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx
    \ setlocal expandtab

" Force to use underline for spell check results
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
    \ highlight SpellBad
    \   cterm=Underline
    \   ctermfg=red
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellCap
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellLocal
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellRare
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  augroup END

" No line numbers in terminal
"autocmd TerminalOpen * set nonumber
