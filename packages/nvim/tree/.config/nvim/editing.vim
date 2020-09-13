"""
""" CODE COMPLETION
"""

""" ALE
""  define fixers
let g:ale_linters = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \}
""  define fixers
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \}
"   autofix
let g:ale_fix_on_save = 1
"   lint on text change
let g:ale_lint_on_text_changed = 'always'
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
  \ '_': ['ale', 'file', 'buffer', 'tmux-complete'],
  \ 'python': ['jedi']
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

""" nerdcommenter
let g:NERDSpaceDelims = 1
