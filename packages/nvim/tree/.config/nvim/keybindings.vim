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

""" ALE shortcuts
nnoremap <leader>n :ALENext<cr>
nnoremap <leader>N :ALEPrevious<cr>
"   goto remaps
nnoremap <silent> gd :ALEGoToDefinition <CR>
nnoremap <silent> gy :ALEGoToTypeDefinition <CR>
nnoremap <silent> gr :ALEFindReferences <CR>

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
