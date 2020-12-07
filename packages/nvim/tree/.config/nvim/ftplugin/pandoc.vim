"   tab size
set tabstop=4
set shiftwidth=4
set expandtab

""  vim-pandoc
let g:pandoc#modules#disabled = ['folding', 'spell']
" let g:pandoc#filetypes#pandoc_markdown = 0

""  delimitMate
let b:delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = "\" ` * _"

""  linters
let b:ale_linter_aliases = ['text']
let b:ale_linters = ['textlint', 'vale']
"   languagetool options
let g:ale_languagetool_options = '--autoDetect -d WHITESPACE_RULE,DASH_RULE,EN_QUOTES'
""  fixers
"   define pandoc formatter
function PandocFix(buffer) abort
  let l:executable = 'pandoc'
  let l:filename = ale#Escape(bufname(a:buffer))
  let l:input_flags = ['markdown',
    \ '+abbreviations',
    \ '+autolink_bare_uris',
    \ '+markdown_attribute',
    \ '+mmd_header_identifiers',
    \ '+mmd_link_attributes',
    \ '+tex_math_double_backslash',
    \ '+emoji',
    \ '+task_lists',
    \ ]
  let l:target_flags = ['markdown',
    \ '+raw_tex',
    \ '-native_spans',
    \ '-simple_tables',
    \ '-multiline_tables',
    \ '-fenced_code_attributes',
    \ '+emoji',
    \ '+task_lists',
    \ ]
  return {
  \   'command': ale#Escape(l:executable)
  \     . ' -f ' . join(l:input_flags, '')
  \     . ' -t ' . join(l:target_flags, '')
  \     . ' -s --wrap=auto --atx-headers --columns=80 '
  \     . l:filename
  \}
endfunction

call ale#fix#registry#Add('pandoc', 'PandocFix', ['pandoc'], 'Pandoc formatter using pandoc')
let b:ale_fixers = ['pandoc']

""  tagbar
let g:tagbar_type_pandoc = {
  \ 'ctagstype': 'markdown',
  \ 'ctagsbin' : g:nvim_config . '/scripts/markdown2ctags.py',
  \ 'ctagsargs' : '-f - --sort=yes --sro=»',
  \ 'kinds' : [
      \ 's:sections',
      \ 'i:images'
  \ ],
  \ 'sro' : '»',
  \ 'kind2scope' : {
      \ 's' : 'section',
  \ },
  \ 'sort': 0,
\}

""  tabular
"   auto-align when using pipe key to make table
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
