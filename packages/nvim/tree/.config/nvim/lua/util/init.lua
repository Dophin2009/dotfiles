-- luacheck: globals vim
local U = {}

--
-- Lua utilities
--

-- Optionally require a module.
U.require = function(pkg)
    local status, module = pcall(require, pkg)
    return status and module or nil
end

--
-- Option utilities
--

-- Set an option for the given buffer.
U.buf_opt = function(bufnr, name, value)
    vim.api.nvim_buf_set_option(bufnr, name, value)
end

--
-- Keybinding utilities
--
U.bind = require 'util/bind'

--
-- Syntax highlight utilities
--
U.hi = require 'util/hi'

return U
