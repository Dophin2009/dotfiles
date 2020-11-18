"""
""" NAVIGATION
"""

""" change tabs
"   focus tab left
nnoremap H gT
"   focus tab right
nnoremap L gt

""" fzf
nnoremap <C-p> :Files<CR>

""" NERDTree
nnoremap <leader>' :NERDTreeToggle<CR>

""" barbar
nnoremap <silent> <C-s> :BufferPick<CR>
"   move to previous/next
nnoremap <silent> t, :BufferPrevious<CR>
nnoremap <silent> t. :BufferNext<CR>
"   re-order to previous/next
nnoremap <silent> t< :BufferMovePrevious<CR>
nnoremap <silent> t> :BufferMoveNext<CR>
"   goto buffer in position
nnoremap <silent> t1 :BufferGoto 1<CR>
nnoremap <silent> t2 :BufferGoto 2<CR>
nnoremap <silent> t3 :BufferGoto 3<CR>
nnoremap <silent> t4 :BufferGoto 4<CR>
nnoremap <silent> t5 :BufferGoto 5<CR>
nnoremap <silent> t6 :BufferGoto 6<CR>
nnoremap <silent> t7 :BufferGoto 7<CR>
nnoremap <silent> t8 :BufferGoto 8<CR>
nnoremap <silent> t9 :BufferLast<CR>
"   close buffer
nnoremap <silent> tc :BufferClose<CR>

""" nvim-lsp
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gC <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gN <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> gn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

""" completion.nvim
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""" ALE shortcuts
nnoremap <leader>n :ALENext<cr>
nnoremap <leader>N :ALEPrevious<cr>

""" toggle tagbar
nnoremap <leader>y :TagbarToggle<CR>

""" toggle minimap
nnoremap <leader>m :MinimapToggle<CR>

"""
""" MISC
"""

""" thesaurus_query.vim
let g:tq_map_keys = 0
nnoremap <leader>t :ThesaurusQueryReplaceCurrentWord<CR>

""" goyo toggle
nnoremap <leader>G :Goyo<CR>
