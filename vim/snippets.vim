" General
iabbrev imp import

" Javascript
iabbrev clg console.log();

" HTML
nnoremap <leader>html :-1read $HOME/.vim/skeleton/skeleton.html<CR>7jwf>a

" Python
function! PythonAbbrev()
  iabbrev <buffer> """ """<CR>"""<Up>
  iabbrev <buffer> ifm if __name__ = "__main__":
endfunction
autocmd BufNewFile,BufRead *.py call PythonAbbrev()

" React
function! ReactAbbrev()
  iabbrev <buffer> imr import React from 'react';
  iabbrev <buffer> imrs import React, {useState} from 'react';
  iabbrev <buffer> sfc export function foo() {<CR><Tab>return null;<CR>}
endfunction
autocmd BufNewFile,BufRead *.jsx call ReactAbbrev()

" Other
iabbrev lipsum Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer diam augue, egestas quis, aliquam ut, venenatis ut, quam. Quisque ut augue. Integer non neque a lectus venenatis fermentum. Morbi quis eros nec elit molestie vehicula. Integer nunc lacus, sodales posuere, rutrum quis, blandit at, mi. Vivamus imperdiet wisi vel mauris. Morbi mattis ante non metus. Sed turpis dui, fermentum ut, aliquam eget, vulputate ullamcorper, pede. Nam non dolor. Etiam lobortis, urna id bibendum convallis, ligula augue auctor eros, a dictum sapien mi a tellus. Proin vel justo. Nunc malesuada turpis a sapien.
