"""
""" LANGUAGE SPECIFIC
"""

""" vim-polyglot
let g:polyglot_disabled = ['latex']

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

""" nvim-lsp
lua require("lsp")

""" diagnostic-nvim
let g:diagnostic_show_sign = 1
let g:diagnostic_enable_virtual_text = 1
" let g:diagnostic_insert_delay = 1

""" completion-nvim
"   enable snippet support
" let g:completion_enable_snippet = 'Neosnippet'
"   use tab for completion menu navigation
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" set completeopt=menuone,noinsert,noselect

""" deoplete
let g:deoplete#enable_at_startup = 1
set completeopt=menuone,noinsert,noselect
"   use tab for completion menu navigation
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"   reduce max list size
call deoplete#custom#option('max_list', 30)
"   delay completion
call deoplete#custom#option('auto_complete_delay', 100)
"   disable clutter sources
" call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})
"   enable echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
"   disable lsp for cpp
call deoplete#custom#source('_', {
\ 'filetype': ['cpp', 'c'],
\ 'disabled_syntaxes': ['lsp']
\ })
"   deoplete-clang options
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"   disable tmux completion trigger
let g:tmuxcomplete#trigger = ''

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
""" SNIPPETS
"""

""" neosnippet
"   use C-k to select snippet
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
"   supertab behavior
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  " \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


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
