"   r configuration
let g:tagbar_type_r = {
  \ 'ctagstype' : 'r',
  \ 'deffile': g:nvim_config . '/ctags/r.ctags',
  \ 'kinds'     : [
    \ 'f:Functions',
    \ 'g:GlobalVariables',
    \ 'v:FunctionVariables',
  \ ]
\ }
