-- luacheck: globals vim
local lualine = require('lualine')

lualine.setup {
    options = {theme = 'gruvbox_material'},
    sections = {
        lualine_c = {{'diagnostics', sources = {'nvim_lsp'}}, 'filename'}
    }
}
