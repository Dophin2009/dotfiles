-- luacheck: globals vim
local lualine = require('lualine')

local M = {}

M.setup = function(theme)
    lualine.setup {
        -- TODO: Colorscheme-based theme
        options = {theme = theme},
        sections = {
            lualine_c = {{'diagnostics', sources = {'nvim_lsp'}}, 'filename'}
        }
    }
end

return M
