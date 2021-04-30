-- luacheck: globals vim
--
-- Syntax highlight utilities
--
local M = {}

-- Easily set the style of a highlight group.
M.g = setmetatable({}, {
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

-- Link a highlight group.
M.link = setmetatable({}, {
    __newindex = function(_, groupm, groupn)
        local cmd = {'hi', 'link', groupm, groupn}
        vim.cmd(table.concat(cmd, ' '))
    end
})

return M
