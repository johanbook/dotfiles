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
nmap <Leader>w :w<CR>
nmap <Leader>ww :w<CR>
nmap <Leader>wq :w<CR> :clo<CR>

" Note order as `nmap` also applies to 
" terminal in normal mode
tnoremap <Leader>q <C-w><C-c>
nmap <Leader>q :clo<CR> 

" When opening files, do so in new vert
nmap gf :vertical wincmd<CR>
" nmap <C-w>f :vertical wincmd<CR>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Needed as `map` does not cover terminal mode
tmap <C-j> <C-W>j
tmap <C-k> <C-W>k
tmap <C-h> <C-W>h
tmap <C-l> <C-W>l

" Explore files
map <C-o> :GFiles<CR> 

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
map <Silent> <Leader><CR> :noh<CR>

" Terminal keys
nmap <Leader>t :vert term<CR> 
nmap <Leader>vt :vert term<CR>
nmap <Leader>xt :term<CR>
tnoremap <ESC> <C-w>N
tnoremap jk <C-w>N
