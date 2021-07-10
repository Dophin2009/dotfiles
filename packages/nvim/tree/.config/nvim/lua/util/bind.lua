-- luacheck: globals vim
--
-- Keybinding utilities
--
local M = {}

local map_opts = function(opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    return options
end

-- Bind a key for some mode.
M.map = function(mode, lhs, rhs, opts)
    local options = map_opts(opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Bind a key for normal mode.
M.nmap = function(lhs, rhs, opts) M.map('n', lhs, rhs, opts) end

-- Bind a key for visual mode.
M.vmap = function(lhs, rhs, opts) M.map('v', lhs, rhs, opts) end

-- Bind a key for insert mode.
M.imap = function(lhs, rhs, opts) M.map('i', lhs, rhs, opts) end

-- Bind a key for select mode.
M.smap = function(lhs, rhs, opts) M.map('s', lhs, rhs, opts) end

M.buf = {
    -- Bind a key for the given buffer.
    map = function(bufnr, mode, lhs, rhs, opts)
        local options = map_opts(opts)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
    end,

    nmap = function(bufnr, lhs, rhs, opts)
        M.buf.map(bufnr, 'n', lhs, rhs, opts)
    end
}

return M
