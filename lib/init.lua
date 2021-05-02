local path = ...
local function require_relative(p) return require(table.concat({path, p}, ".")) end

-- Export batteries
require_relative('batteries'):export()

-- Merge and overwrite tables.
-- luacheck: globals table
function table.overwrite(m, n) for k, v in pairs(n) do m[k] = v end end

-- Extend a list table.
function table.extend(t, ...) for _, v in ipairs({...}) do table.push(t, v) end end

-- Other utilities
local M = {}

-- Require, but return nil if not found.
M.require_opt = function(p)
    local status, import = pcall(require, p)
    if status then
        return import
    else
        return nil
    end
end

return M
