"   makefile configuration
let g:tagbar_type_make = {
  \ 'deffile': g:nvim_config . '/ctags/make.ctags',
  \ 'kinds':[
      \ 'm:macros',
      \ 't:targets'
  \ ]
\}
