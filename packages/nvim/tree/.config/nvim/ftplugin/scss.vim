" linters
let b:ale_linters = []
" fixers
let b:ale_fixers = []

" tagbar
let g:tagbar_type_scss = {
  \ 'deffile': g:nvim_config . '/ctags/scss.ctags',
  \ 'kinds':[
      \ 'c:classes',
      \ 'i:ids',
      \ 't:tags',
      \ 'm:media',
      \ 'v:variables',
  \ ]
\}
