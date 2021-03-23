""""""""""""""""""""""""""""""""""""""""
" Mappings
"""
"""""""""""""""""""""""""""""""""""""
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


" Remap keys for gotos
tnoremap <silent> <Leader>g :vertical wincmd f<CR>
nmap <silent> <Leader>g <Plug>(coc-definition)

" When opening files, do so in new vert
map <silent> gf :vertical wincmd f<CR>
" mp <C-w>f :vertical wincmd f<CR>

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
map <C-p> :GFiles<CR> 

" View folder of current buffer
" Capital E will open hidden buffer
noremap <C-o> :Explore %:h<CR>
noremap <C-o>v :Vexplore %:h<CR>

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
map <silent> <Leader><CR> :noh<CR>

" Terminal keys
abbreviate cterm term ++curwin
abbreviate vterm vert term
nmap <Leader>vt :vert term<CR>
nmap <Leader>xt :term<CR>
tnoremap <ESC> <C-w>N 
tnoremap jk <C-w>N


nmap <Leader>b :Buffers<CR> 
nmap <Leader>l :Lines<CR> 
nmap <Leader>t :TestFile<CR> 

" Navigate errors
nmap <silent> <leader>e <Plug>(ale_next_wrap)
nmap <silent> <leader>E <Plug>(ale_previous_wrap)

abbreviate EditVimrc e ~/.vimrc

" Git aliases
abbreviate Ga G add
abbreviate Gaa G add -A
abbreviate Gbd G branch -d
abbreviate Gc G checkout
abbreviate Gcm G commit -m
abbreviate Gd G diff
abbreviate Gdc G diff --cached
abbreviate Gdb Gbd
abbreviate Gcb G checkout -b
abbreviate Gcnb Gcb
abbreviate Gl G log -25 --graph --oneline --decorate --pretty=format:"%C(yellow)%h - %C(green)%cn %C(reset)%s %C(blue bold)%d"
abbreviate Gp G push
abbreviate Gpl G pull
abbreviate Gr G rebase
abbreviate Gri G rebase -i
abbreviate Gsp G stash pop
abbreviate Gst G stash
abbreviate Gprune G remote prune origin

