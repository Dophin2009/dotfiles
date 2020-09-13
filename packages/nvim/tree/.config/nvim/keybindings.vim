"""
""" NAVIGATION
"""

""" change tabs
"   focus tab left
nnoremap H gT
"   focus tab right
nnoremap L gt

""" ranger
nnoremap <leader>rr :RangerEdit<cr>
nnoremap <leader>rv :RangerVSplit<cr>
nnoremap <leader>rs :RangerSplit<cr>
nnoremap <leader>rt :RangerTab<cr>
nnoremap <leader>ri :RangerInsert<cr>
nnoremap <leader>ra :RangerAppend<cr>
nnoremap <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
nnoremap <leader>rd :RangerCD<cr>
nnoremap <leader>rld :RangerLCD<cr>

nnoremap <leader>y :TagbarToggle<cr>

"""
""" MISC
"""

""" thesaurus_query.vim
let g:tq_map_keys = 0
nnoremap <leader>t :ThesaurusQueryReplaceCurrentWord<CR>

""" goyo toggle
nnoremap <leader>G :Goyo<cr>
