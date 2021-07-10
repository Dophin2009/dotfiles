-- luacheck: globals vim
local compe = require 'compe'

local bind = require 'util.bind'

compe.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        calc = false,
        buffer = true,
        nvim_lsp = true,
        nvim_lua = true,
        omni = {filetypes = {'tex'}},
        path = true,
        snippets_nvim = false,
        spell = false,
        tags = false,
        treesitter = false,
        tmux = false,
        ultisnips = true,
        vsnip = false
    }
}

-- Tab completion
local is_prior_char_whitespace = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
    elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or
        vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        return vim.api.nvim_replace_termcodes(
                   "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>", true, true, true)
    elseif is_prior_char_whitespace() then
        return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return vim.api.nvim_replace_termcodes("<C-p>", true, true, true)
    elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        return vim.api.nvim_replace_termcodes(
                   "<C-R>=UltiSnips#JumpBackwards()<CR>", true, true, true)
    else
        return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
    end
end

bind.imap("<Tab>", "v:lua.tab_complete()", {expr = true, noremap = true})
bind.smap("<Tab>", "v:lua.tab_complete()", {expr = true, noremap = true})
bind.imap("<S-Tab>", "v:lua.s_tab_complete()", {expr = true, noremap = true})
bind.smap("<S-Tab>", "v:lua.s_tab_complete()", {expr = true, noremap = true})
bind.imap("<CR>", 'compe#confirm(lexima#expand("<LT>CR>", "i"))',
          {expr = true, noremap = true})
bind.imap("<C-e>", "compe#close('<C-e>')", {expr = true, noremap = true})
bind.imap("<C-f>", "compe#scrol({ 'delta': +4 })", {expr = true, noremap = true})
bind.imap("<C-d>", "compe#scrol({ 'delta': -4 })", {expr = true, noremap = true})
