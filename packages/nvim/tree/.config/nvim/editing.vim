"""
""" SYNTAX
"""

""" treesitter
" lua require('treesitter')

"""
""" CODE COMPLETION
"""

""" nvim-lsp
lua require('lsp')
set completeopt=menuone,noinsert,noselect
aug lsp_autocmds
  autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
aug END

""" completion-nvim
let g:completion_matching_smart_case = 1
let g:completion_chain_complete_list = [
  \ {'complete_items': ['lsp', 'snippet', 'path']}
  \]

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
"   auto import on completion
" let g:ale_completion_autoimport = 1
"   lint on text change
let g:ale_lint_on_text_changed = 'always'
"   linting message
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"   open warning/error list
" let g:ale_open_list = 1

""" deoplete
" let g:deoplete#enable_at_startup = 1
" set completeopt=menuone,noinsert,noselect
"   use tab for completion menu navigation
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"   enable ALE completion source
" call deoplete#custom#option('sources', {
  " \ '_': ['ale', 'file', 'buffer'],
  " \ 'python': ['jedi'],
  " \ 'tex': ['omni']
  " \})
" call deoplete#custom#var('omni', 'input_patterns', {
  " \ 'tex': g:vimtex#re#deoplete
  " \})
"   reduce max list size
" call deoplete#custom#option('max_list', 30)
"   delay completion
" call deoplete#custom#option('auto_complete_delay', 100)
"   deoplete-clang options
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"   javacomplete2 options
" let g:JavaComplete_CheckServerVersionAtStartup = 0
"   disable tmux completion trigger
" let g:tmuxcomplete#trigger = ''

""" deoplete echodoc
"   enable echodoc
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'floating'

""" nvim-typescript
" let g:nvim_typescript#type_info_on_hold = 1

""" delimitMate
let g:delimitMate_expand_cr = 2

""" vim-closetag
let g:closetag_filetypes = 'html,xhtml,phtml,html.handlebars,javascriptreact,typescriptreact'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_close_shortcut = '<leader>>'

""" nerdcommenter
let g:NERDSpaceDelims = 1
