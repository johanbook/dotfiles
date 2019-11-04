""""""""""""""""""""""""""""""""""""""""
" File specific formatting
""""""""""""""""""""""""""""""""""""""""

" Python formatting
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set number

" HTML/CSS/JS formatting
au BufNewFile,BufRead *.js,*.jsx,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.js,*.jsx
    \ set number |
    \ set expandtab


