" linters
" function! DhallProjectRoot(buffer) abort
  " return expand('#' . a:buffer . ':p')
" endfunction
" call ale#linter#Define('dhall', {
" \   'name': 'dhall-lsp',
" \   'lsp': 'stdio',
" \   'executable': 'dhall-lsp-server',
" \   'command': '%e',
" \   'project_root': function('DhallProjectRoot')
" \})
" let b:ale_linters = ['dhall-lsp']
" fixers
let b:ale_fixers = []
