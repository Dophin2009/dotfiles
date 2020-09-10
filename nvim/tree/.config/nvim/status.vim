"""
""" WINDOW
"""

""" tagbar
"   more compact
let g:tagbar_compact = 1
let g:tagbar_indent = 1
"   set to be wider
let g:tagbar_width = 60
"   show line numbers
let g:tagbar_show_linenumbers = 1
"   rust configuration
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

""" airline
"   enable tabline status
let g:airline#extensions#tabline#enabled = 1
"   enable ALE status
let g:airline#extensions#ale#enabled = 1
"   enable powerline fonts
let g:airline_powerline_fonts = 1

""" gitgutter
let g:gitgutter_max_signs = 1000
