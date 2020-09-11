" linters
let b:ale_linters = ['rustc', 'analyzer']
" fixers
let b:ale_fixers = ['rustfmt', 'remove_trailing_lines', 'trim_whitespace']
" tagbar
let g:tagbar_type_rust = {
  \ 'ctagsbin' : 'ctags',
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
