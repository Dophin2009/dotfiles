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

U.hi = setmetatable({}, {
    __newindex = function(_, hlgroup, args)
        local guifg, guibg, gui, guisp = args.guifg, args.guibg, args.gui,
                                         args.guisp
        local cmd = {'hi', hlgroup}
        if guifg then table.insert(cmd, 'guifg=' .. guifg) end
        if guibg then table.insert(cmd, 'guibg=' .. guibg) end
        if gui then table.insert(cmd, 'gui=' .. gui) end
        if guisp then table.insert(cmd, 'guisp=' .. guisp) end
        vim.cmd(table.concat(cmd, ' '))
    end
})

U.hilink = setmetatable({}, {
    __newindex = function(_, groupm, groupn)
        local cmd = {'hi', 'link', groupm, groupn}
        vim.cmd(table.concat(cmd, ' '))
    end
})

return U
