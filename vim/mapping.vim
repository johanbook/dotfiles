""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Remap escape
inoremap jk <ESC>

" Saving and exiting
nmap <leader>w :w<cr>
nmap <leader>ww :w<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q!<cr>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Can also use Vexplore
map <C-o> :e .<CR> 

" Move between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Get off my lawn
nnoremap <Left>     :echoerr "Use h"<CR>
nnoremap <Right>    :echoerr "Use l"<CR>
nnoremap <Up>       :echoerr "Use k"<CR>
nnoremap <Down>     :echoerr "Use j"<CR>

" Remove search highlighting
map <silent> <leader><cr> :noh<cr>

" Insert single character
nnoremap <C-i> i_<Esc>r

autocmd FileType python nnoremap <buffer> <F5> :exec '!clear; python' shellescape(@%, 1)<cr>

