local U = require('util')

local g = vim.g

-- Use powerline fonts
g.airline_powerline_fonts = 1

-- Enable tabline status
g['airline#extensions#tabline#enabled'] = 1

-- Enable wordcount for filetypes
g['airline#extensions#wordcount#filetypes'] =
    [[ \vasciidoc|help|mail|markdown|pandoc|org|rst|tex|text ]]

-- Disable lsp_status integration
g['airline#extensions#nvimlsp#enabled'] = 0
-- if U.require('lsp_status') then g['g:airline#extensions#nvimlsp#enabled'] = 1 end
