" General
iabbrev imp import
iabbrev heigth height
iabbrev teh the

" Javascript
iabbrev clg console.log();

" HTML
nnoremap <leader>html :-1read $HOME/.vim/skeleton/skeleton.html<CR>7jwf>a

" Markdown
function! MarkdownAbbrev()
  iabbrev <buffer> alviss alvíss
  iabbrev <buffer> Alviss Alvíss
endfunction
autocmd BufNewFile,BufRead *.md call MarkdownAbbrev()



" Python
function! PythonAbbrev()
  iabbrev <buffer> """ """<CR>"""<Up>
  iabbrev <buffer> ifm if __name__ = "__main__":
endfunction
autocmd BufNewFile,BufRead *.py call PythonAbbrev()

" React
function! ReactAbbrev()
  iabbrev <buffer> imr import React from 'react';
  iabbrev <buffer> impp import PropTypes from 'prop-types';
  iabbrev <buffer> imrs import React, {useState} from 'react';
  iabbrev <buffer> sfc import React from "react"; <CR><CR>export default function ({}) {<CR><Tab>return (<React.Fragment></React.Fragment>);<CR>}
endfunction
autocmd BufNewFile,BufRead *.jsx call ReactAbbrev()

" Other
iabbrev lorem Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer diam augue, egestas quis, aliquam ut, venenatis ut, quam. Quisque ut augue. Integer non neque a lectus venenatis fermentum. Morbi quis eros nec elit molestie vehicula. Integer nunc lacus, sodales posuere, rutrum quis, blandit at, mi. Vivamus imperdiet wisi vel mauris. Morbi mattis ante non metus. Sed turpis dui, fermentum ut, aliquam eget, vulputate ullamcorper, pede. Nam non dolor. Etiam lobortis, urna id bibendum convallis, ligula augue auctor eros, a dictum sapien mi a tellus. Proin vel justo. Nunc malesuada turpis a sapien.
