"   fixers
let b:ale_linter_aliases = ['r']
"   rmarkdown configuration
let g:tagbar_type_rmd = {
  \   'ctagstype': 'rmd'
  \ , 'kinds': ['h:header', 'c:chunk', 'f:function', 'v:variable']
  \ , 'sro': '&&&'
  \ , 'kind2scope': {'h':'header', 'c':'chunk'}
  \ , 'sort': 0
  \ , 'ctagsbin': g:nvim_config . 'scripts/rmdtags.py'
  \ , 'ctagsargs': ''
  \ }
