" tagbar
let g:tagbar_type_yaml = {
  \ 'ctagstype' : 'yaml',
  \ 'deffile': g:nvim_config . '/ctags/yaml.ctags',
  \ 'kinds' : [
      \ 'a:anchors',
      \ 's:section',
      \ 'e:entry'
  \ ],
  \ 'sro' : '.',
  \ 'scope2kind': {
    \ 'section': 's',
    \ 'entry': 'e'
  \ },
  \ 'kind2scope': {
    \ 's': 'section',
    \ 'e': 'entry'
  \ },
  \ 'sort' : 0
  \ }
