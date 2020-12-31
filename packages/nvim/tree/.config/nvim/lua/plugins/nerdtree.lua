local U = require('util')
local g = vim.g

-- Toggle tree
U.nmap('<leader>\'', '<cmd>NERDTreeToggle<CR>')

-- Custom git symbols
g.NERDTreeGitStatusIndicatorMapCustom = {
    Modified = '*',
    Staged = '+',
    Untracked = '~',
    Renamed = '➜',
    Unmerged = '═',
    Deleted = '✖',
    Dirty = '✗',
    Ignored = 'o',
    Clean = '✔︎',
    Unknown = '?'
}

vim.api.nvim_exec([[
augroup nerdtree_autoclose
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
]], true)
