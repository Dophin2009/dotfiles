"""
""" NAVIGATION
"""

""" change tabs
"   focus tab left
nnoremap H gT
"   focus tab right
nnoremap L gt

""" NERDTree
nnoremap <leader>l :NERDTreeToggle<CR>

""" vifm
" nnoremap <leader>rr :Vifm<cr>
" nnoremap <leader>rv :VsplitVifm<cr>
" nnoremap <leader>rs :SplitVifm<cr>
" nnoremap <leader>rt :TabVifm<cr>

""" ALE shortcuts
nnoremap <leader>n :ALENext<cr>
nnoremap <leader>N :ALEPrevious<cr>
"   goto remaps
nnoremap <silent> gd :ALEGoToDefinition <CR>
nnoremap <silent> gy :ALEGoToTypeDefinition <CR>
nnoremap <silent> gr :ALEFindReferences <CR>

""" toggle tagbar
nnoremap <leader>y :TagbarToggle<cr>

""" toggle minimap
nnoremap <leader>m :MinimapToggle<cr>

"""
""" MISC
"""

""" thesaurus_query.vim
let g:tq_map_keys = 0
nnoremap <leader>t :ThesaurusQueryReplaceCurrentWord<CR>

""" goyo toggle
nnoremap <leader>G :Goyo<cr>
