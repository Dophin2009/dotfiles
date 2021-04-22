-- luacheck: globals vim
local U = {}

U.require = function(pkg)
    local status, module = pcall(require, pkg)
    return status and module or nil
end

U.map = function(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

U.nmap = function(lhs, rhs, opts) U.map('n', lhs, rhs, opts) end

return U
