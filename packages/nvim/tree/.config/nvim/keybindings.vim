"""
""" NAVIGATION
"""

""" change tabs
"   focus tab left
nnoremap H gT
"   focus tab right
nnoremap L gt

"   disable highlight search
nnoremap <leader>n <cmd>nohlsearch<CR>


""" fzf
nnoremap <C-p> <cmd>Files<CR>

""" NERDTree
nnoremap <leader>' <cmd>NERDTreeToggle<CR>

""" barbar
nnoremap <silent> <C-s> <cmd>BufferPick<CR>
"   move to previous/next
nnoremap <silent> t, <cmd>BufferPrevious<CR>
nnoremap <silent> t. <cmd>BufferNext<CR>
"   re-order to previous/next
nnoremap <silent> t< <cmd>BufferMovePrevious<CR>
nnoremap <silent> t> <cmd>BufferMoveNext<CR>
"   goto buffer in position
nnoremap <silent> t1 <cmd>BufferGoto 1<CR>
nnoremap <silent> t2 <cmd>BufferGoto 2<CR>
nnoremap <silent> t3 <cmd>BufferGoto 3<CR>
nnoremap <silent> t4 <cmd>BufferGoto 4<CR>
nnoremap <silent> t5 <cmd>BufferGoto 5<CR>
nnoremap <silent> t6 <cmd>BufferGoto 6<CR>
nnoremap <silent> t7 <cmd>BufferGoto 7<CR>
nnoremap <silent> t8 <cmd>BufferGoto 8<CR>
nnoremap <silent> t9 <cmd>BufferLast<CR>
"   close buffer
nnoremap <silent> tc <cmd>BufferClose<CR>

""" nvim-lsp
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gC <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gN <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> gn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

""" completion.nvim
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""" toggle tagbar
" nnoremap <leader>y :TagbarToggle<CR>

""" toggle minimap
" nnoremap <leader>m :MinimapToggle<CR>

"""
""" MISC
"""

""" thesaurus_query.vim
let g:tq_map_keys = 0
nnoremap <leader>t <cmd>ThesaurusQueryReplaceCurrentWord<CR>

""" ditto
nnoremap <leader>di <cmd>ToggleDitto<CR>
nnoremap <leader>=d <Plug>DittoNext
nnoremap <leader>-d <Plug>DittoPrev
nnoremap <leader>+d <Plug>DittoGood
nnoremap <leader>_d <Plug>DittoBad
nnoremap <leader>]d <Plug>DittoMore
nnoremap <leader>[d <Plug>DittoLess

""" goyo toggle
nnoremap <leader>G <cmd>Goyo<CR>
