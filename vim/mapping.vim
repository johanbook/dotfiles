""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Remap escape
inoremap jk <ESC>

" Unset recording, as I never use that
map q <Nop> 

" Unset Ex mode
map Q <Nop> 

" Saving and exiting
nmap <leader>w :w<cr>
nmap <leader>ww :w<cr>
nmap <leader>wq :w<cr> :clo<cr>
nmap <leader>q :clo<cr>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Can also use Vexplore
map <C-o> :GFiles<CR> 

" Move between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Get off my lawn
nnoremap <Left>     :echoerr "Use h"<CR>
nnoremap <Right>    :echoerr "Use l"<CR>
nnoremap <Up>       :echoerr "Use k"<CR>
nnoremap <Down>     :echoerr "Use j"<CR>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>

" Remove search highlighting
map <silent> <leader><cr> :noh<cr>

" Terminal keys
nmap <leader>vt :vert term<cr>
nmap <leader>xt :term<cr>
tnoremap <leader>q <C-w><C-c>

" Insert single character
nnoremap <C-i> i_<Esc>r

autocmd FileType python nnoremap <buffer> <F5> :exec '!clear; python' shellescape(@%, 1)<cr>

