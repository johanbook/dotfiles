""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Saving and exiting
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>qq :q!<cr>
nmap <leader>x :wq<cr>
nnoremap zz :update<cr>
nnoremap zx :wq<cr>
nnoremap xx :q!<cr>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Get off my lawn
nnoremap <Left>     :echoerr "Use h"<CR>
nnoremap <Right>    :echoerr "Use l"<CR>
nnoremap <Up>       :echoerr "Use k"<CR>
nnoremap <Down>     :echoerr "Use j"<CR>

" Inserting lines
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Remove search highlighting
map <silent> <leader><cr> :noh<cr>

