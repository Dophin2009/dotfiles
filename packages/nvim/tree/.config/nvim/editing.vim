"""
""" SYNTAX
"""

""" treesitter
lua require('treesitter')

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
