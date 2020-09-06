"""
""" LANGUAGE SPECIFIC
"""

""" vim-polyglot
let g:polyglot_disabled = ['go', 'pgsql']

""" vim-go
let g:go_code_completion_enabled = 1
let g:go_auto_type_info = 1
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 1
let g:go_snippet_engine = "automatic"
let g:go_autodetect_gopath = 1
let g:go_gocode_propose_source = 1
"   disable vim-go :GoDef short cut (gd)
"   this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

""" vim-pandoc
let g:pandoc#modules#disabled = ['folding', 'spell']
" let g:pandoc#filetypes#pandoc_markdown = 0

""" pgsql.vim
let g:sql_type_default = 'pgsql'


"""
""" CODE COMPLETION
"""

""" ALE
""  define linters and fixers
let g:ale_linters = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \}
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \}
"   autofix
let g:ale_fix_on_save = 1
"   goto remaps
nnoremap <silent> gd :ALEGoToDefinition <CR>
nnoremap <silent> gy :ALEGoToTypeDefinition <CR>
nnoremap <silent> gr :ALEFindReferences <CR>

""" deoplete
let g:deoplete#enable_at_startup = 1
set completeopt=menuone,noinsert,noselect
"   use tab for completion menu navigation
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"   enable ALE completion source
call deoplete#custom#option('sources', {
  \ '_': ['ale'],
  \})
"   reduce max list size
call deoplete#custom#option('max_list', 30)
"   delay completion
call deoplete#custom#option('auto_complete_delay', 100)
"   deoplete-clang options
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"   disable tmux completion trigger
let g:tmuxcomplete#trigger = ''

""" deoplete echodoc
"   enable echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

""" delimitMate
let g:delimitMate_expand_cr = 2

""" vim-closetag
let g:closetag_filetypes = 'html,xhtml,phtml,javascriptreact,typescriptreact'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_close_shortcut = '<leader>>'


"""
""" FORMATTING
"""

""" neoformat
"   auto-format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
""  default formatting
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
""  define formatters
"   javascript / typescript / react stuff
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']
let g:neoformat_typescriptreact_prettier = {
  \ 'exe': 'prettier',
  \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
  \ 'stdin': 1,
  \ }
"   lua
let g:neoformat_enabled_lua = ['luaformat']
let g:neoformat_lua_luaformat = {
  \ 'exe': 'lua-format',
  \ 'stdin': 1,
  \ }
"   markdown
let g:neoformat_enabled_markdown = ['']
"   pandoc
let g:neoformat_pandoc_prettier = {
  \ 'exe': 'prettier',
  \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
  \ 'stdin': 1,
  \ }
"   pg sql
let g:neofromat_sql_pg_format = {
  \ 'exe': 'pg_format',
  \ 'args': ['-m 90', '-s 2'],
  \ }
"   sql
let g:neoformat_enabled_sql = ['pg_format']
"   rust
let g:neoformat_enabled_rust = ['rustfmt']

""" nerdcommenter
let g:NERDSpaceDelims = 1

""" tabular
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
